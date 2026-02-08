# Build-time variables
ARG RELEASE=prod
ARG ALPINE_VERSION=3.15
ARG GOLANG_VERSION=1.15
ARG NODE_VERSION=16

# backend build (api server)
FROM golang:${GOLANG_VERSION}-alpine AS api-build
RUN apk add --no-cache bash dep make git curl g++

ARG RELEASE
COPY ./api /go/src/samlet-chat/api/
WORKDIR /go/src/samlet-chat/api
RUN make ${RELEASE} -j$(($(nproc) + 1))


# frontend build (html, js, css, images)
FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION} AS frontend-build
RUN apk add --no-cache bash make python2 g++

ARG RELEASE
COPY ./frontend /samlet-chat/frontend
WORKDIR /samlet-chat/frontend/
RUN make ${RELEASE} -j$(($(nproc) + 1))


# templates and db build
FROM alpine:${ALPINE_VERSION} AS templates-db-build
RUN apk add --no-cache bash make

ARG RELEASE
COPY ./templates /samlet-chat/templates
WORKDIR /samlet-chat/templates
RUN make ${RELEASE} -j$(($(nproc) + 1))

COPY ./db /samlet-chat/db
WORKDIR /samlet-chat/db
RUN make ${RELEASE} -j$(($(nproc) + 1))


# final image
FROM gcr.io/distroless/static-debian11

ARG RELEASE

COPY --from=api-build /go/src/samlet-chat/api/build/${RELEASE}/samlet-chat /samlet-chat/samlet-chat
COPY --from=frontend-build /samlet-chat/frontend/build/${RELEASE}/js /samlet-chat/js
COPY --from=frontend-build /samlet-chat/frontend/build/${RELEASE}/css /samlet-chat/css
COPY --from=frontend-build /samlet-chat/frontend/build/${RELEASE}/images /samlet-chat/images
COPY --from=frontend-build /samlet-chat/frontend/build/${RELEASE}/fonts /samlet-chat/fonts
COPY --from=frontend-build /samlet-chat/frontend/build/${RELEASE}/i18n /samlet-chat/i18n
COPY --from=frontend-build /samlet-chat/frontend/build/${RELEASE}/*.html /samlet-chat/
COPY --from=templates-db-build /samlet-chat/templates/build/${RELEASE}/templates /samlet-chat/templates/
COPY --from=templates-db-build /samlet-chat/db/build/${RELEASE}/db /samlet-chat/db/

EXPOSE 8080
WORKDIR /samlet-chat/
ENV COMMENTO_BIND_ADDRESS="0.0.0.0"
USER nobody
ENTRYPOINT ["/samlet-chat/samlet-chat"]
