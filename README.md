# samlet-chat

### 💬 Try it out and deploy your own
[LIVE DEMO](https://samlet-chat.valiantlynx.com/login)

### ❓ About
samlet-chat is a free, open source, fast & lightweight comments box that you can embed in your static website instead of Disqus.

### ⚡ Features
- Markdown support
- Import from Disqus
- Voting
- Automated spam detection (Askimet and Perspective integration)
- Moderation tools
- Sticky comments
- Thread locking
- OAuth login (Google, Github, Twitter) and single sign-on
- Hot-reloading of comments
- Email notifications.


### 🎨 Design System

The frontend uses a modern, professional design system inspired by shadcn/ui and Vercel. See the design resources:

- **[Design System Documentation](./frontend/DESIGN_SYSTEM.md)** - Complete guides, color palette reference, and usage examples
- **[Color Palette Reference](./frontend/COLOR_PALETTE.html)** - Interactive visual color reference (open in browser)

The system features the brand gold color (#FFD700) as primary with semantic colors for success, warning, destructive, and info states.


### 📷 Screenshots
![samlet-chat in action](https://i.imgur.com/x4IA22n.gif)

### 🤔 How is this different from Disqus, Facebook Comments, and the rest?

- 🐱‍👤  Respects your privacy and no adverts
- 💄 Prettier comments box compared to other FOSS alternatives
- ⚡ Orders of magnitude lighter and faster than alternatives
- 🕐 One click to deploy your own instance to a free Heroku account in seconds
- 🔌 You can self-host too for maximum control!

### Get started

To start you just need to launch an instance.

If you want to self-host, you will need a PostgreSQL server handy and then:
1) Use this repo's Dockerfile if you're into that kind of thing
2) Download the plug and play pre-compiled version from the [releases](https://github.com/samletnorge/samlet-chat/releases)
3) To build yourself, you can clone this repo (you will require `nodejs`, `yarn`, `golang` installed) and run `make prod` and you will generate `./build/prod/samlet-chat`


To launch, you should configure the following environment variables below:
```
$ export SAMLETCHAT_ORIGIN=http://samlet-chat.example.com:8080
$ export SAMLETCHAT_PORT=8080
$ export SAMLETCHAT_POSTGRES=postgres://username:password@postgres.example.com:5432/samlet-chat?sslmode=disable
$ export SAMLETCHAT_CDN_PREFIX=$SAMLETCHAT_ORIGIN

```

And then you can run the `samlet-chat` binary.

#### Logging and graphing page views

The logging defaults to off to preseve disk space, but you can specify the `SAMLETCHAT_ENABLE_LOGGING` environment variable to true to enable each page view being logged and a nice graph generated on your dashboard. This will however use up a lot of space quickly if you have a high traffic website; you may want to consider a more fully-featured analytics solution for your website.

e.g.

```
$ export SAMLETCHAT_ENABLE_LOGGING=true
```

to turn this feature on.

#### Wildcard domain support
A new feature added recently, with better edge-case handling of domain names, etc.

This feature however will open up your samlet-chat instance to abuse if it is shared between a lot of people (e.g. people registering `e%` to register *every domain beginning with e*...)

As most of samlet-chat instances are serving one user only, I have assumed you will be sensible about this and enabled wildcard domain support by default. 

If you want the old behaviour, you can disable this with an environment variable:

```
$ export SAMLETCHAT_ENABLE_WILDCARDS=false
```

#### Perspective spam detection 
To enable Perspective (https://www.perspectiveapi.com/) spam detection add following environment variables:

```
$ export SAMLETCHAT_PERSPECTIVE_KEY=YOUR_API_KEY_FROM_PERSPECTIVE
$ export SAMLETCHAT_PERSPECTIVE_LIMIT=0.5
$ export SAMLETCHAT_PERSPECTIVE_LANGUAGE=en
```

SAMLETCHAT_PERSPECTIVE_KEY:
To create a new Perspective API key follow the instructions at https://developers.perspectiveapi.com/s/docs-get-started

SAMLETCHAT_PERSPECTIVE_LIMIT:
The limit defines the minimum value for the Perspective probability summary score. Everything above the value will be flagged in samlet-chat. (Default 0.5)

SAMLETCHAT_PERSPECTIVE_LANGUAGE:
Configure the language to your requirements. (Default: en)

Make sure that you have enabled the automatic spam detection in the dashboard.


#### Disabling SMTP Host verification check

samlet-chat allows configuration of the tlsConfig for both SMTPS as well as StartTLS for email sending.
For context, this is required for the [https://cloudron.io/](Cloudron) app package.

To skip SMTP hostname verification, use:

```
$ export SMTP_SKIP_HOST_VERIFY=true
```

#### STARTTLS
If you have any issues with email sending relating to not using STARTTLS, consider:

```
$ export USE_STARTTLS=true
```


#### Docker setup
Alternatively you can use the pre-build images from:
- https://ghcr.io/samletnorge/samlet-chat
- https://hub.docker.com/r/samletnorge/samlet-chat

Instructions for configuring the docker image can be found [here](https://docs.samlet-chat.valiantlynx.com/installation/self-hosting/on-your-server/docker.html). 


### Finally

Once you have created an account in your samlet-chat instance, it should give you instructions on how to embed this into your site! It should be as simple as:

```
<script defer src="https://(server url)/js/samlet-chat.js"></script>
<div id="samlet-chat"></div>
```

### If you're running this behind nginx/another reverse proxy
Remember to either forward the websockets through to samlet-chat in your nginx config, e.g.:

```
location / {
    proxy_pass http://samlet-chat;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header Host $host;
}
```

Or if you'd rather not do that, disable websockets in favour of HTTP polling by adding `data-no-websockets="true"` to the samlet-chat <script> tag (or `data-no-livereload="true"`` to only load comments on page load, see below!)

### SSL Support
samlet-chat supports native SSL without use of an nginx proxy. Three properties are required for Native SSL:

- SAMLETCHAT_SSL
- SAMLETCHAT_SSL_CERT
- SAMLETCHAT_SSL_KEY

`SAMLETCHAT_SSL=true` enables native SSL. Default is false.

If `SAMLETCHAT_SSL=true` then `SAMLETCHAT_SSL_CERT` and `SAMLETCHAT_SSL_KEY` must be set to the path to a valid SSL Certificate and Key pair.

### More options to configure samlet-chat's frontend

You can add the following to samlet-chat's script tag:

- `data-css-override="http://server/styles.css"` - A URL to a CSS file with overriding styles. Defaults to no override and uses samlet-chat's default theme.
- `data-auto-init="false"` - samlet-chat automatically initialises itself when the page is loaded. If you prefer to load samlet-chat dynamically (for example, after the user clicks a button), you can disable this. You will be required to call `window.chat.main()` when you want to load samlet-chat. By default, this is true.
- `data-id-root="notsamlet-chat"` - By default, samlet-chat looks for a `<div>` with `id="samlet-chat"`. If you want to load samlet-chat in a different element, you can set this attribute to the ID of that element.
- `data-no-fonts="true"` - By default, samlet-chat uses the Source Sans Pro font to present a good design out-of-the-box. If you'd like to disable this so that samlet-chat never loads the font files, you can set this to true. By default, this is true.
- `data-hide-deleted` - By default, deleted comments with undeleted replies are shown with a "[deleted]" tag. If you'd like to disable this, setting this to true will hide deleted comments even if there are legitimate replies underneath. Deleted comments without any undeleted comments underneath are hidden irrespective of the value of this function. By default, this is false.
- `data-no-websockets="true"` - Disables websocket functionality in favour of HTTP polling to have the same live reload functionality in a situation where websockets aren't allowed (e.g. a reverse proxy)
- `data-no-livereload="true"` - Disabled all hot reload functionality (this supercedes the above flag) - all comments are loaded once and only once on page load.

e.g. Usage example:
```
<script defer src="https://chat.mookerj.ee/js/samlet-chat.js" data-no-websockets="true"></script>
```

### How is this different to the original samlet-chat?
This fork implements new features such as:
- AI integration support
- Auto chat translation like in game chat
- Internationalization support
- Revamped UI

### How to use this in a SPA (Single Page Application)

samlet-chat runs a bit of code on page load to initialize the widget. This widget can be customized by using data attributes on the script tag. When using samlet-chat in a SPA you might want to change the pageId for the widget when navigating to a new blog post without a browser page load. Below you'll find an example for an samlet-chat component in React:

```js
import React, { useEffect } from 'react'

const Chat = ({ pageId }) => {
  useEffect(() => {
    if (typeof window !== 'undefined' && !window.chat) {
      // init empty object so samlet-chat.js script extends this with global functions
      window.chat = {}
      const script = document.createElement('script')
      // Replace this with the url to your samlet-chat instance's samlet-chat.js script
      script.src = `http://localhost:8080/js/samlet-chat.js`
      script.defer = true
      // Set default attributes for first load
      script.setAttribute('data-auto-init', false)
      script.setAttribute('data-page-id', pageId)
      script.setAttribute('data-id-root', 'samlet-chat-box')
      script.onload = () => {
        // Tell samlet-chat.js to load the widget
        window.chat.main()
      }
      document.getElementsByTagName('head')[0].appendChild(script)
    } else if (typeof window !== 'undefined' && window.chat) {
      // In-case the samlet-chat.js script has already been loaded reInit the widget with a new pageId
      window.chat.reInit({
        pageId: pageId,
      })
    }
  }, [])

  return <div id="samlet-chat-box" />
}

export default Chat
```

samlet-chat initializes itself and extends the `window.chat` object. When you have an HTML element with the id `samlet-chat` this will live on the `window.chat` namespace. Replacing the HTML element (as SPAs do) the `window.chat` is reset to the new element, losing all extended functionality provided by the samlet-chat script. Make sure to provide a `data-id-root` other than `samlet-chat` for this to work, see `samlet-chat-box` in the example above. 

The `window.chat.reInit` function can be called with the following updated options (all optional):

```js
{
    pageId: "string", // eg: "path/to/page"
    idRoot: "string", // eg: "new-element-id"
    noFonts: "string", // Boolean string, "true" or "false"
    hideDeleted: "string", // Boolean string, "true" or "false"
    cssOverride: "string" // or null to reset to undefined
}
```
