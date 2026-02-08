### Compiling From Source

#### Introduction

To install samlet-chat from source, first [set up your environment](/contributing/development-environment.md) first. Once you've done that, you can go ahead and build the project. The rest of this tutorial assumes you have all the necessary tools installed.

#### Compiling samlet-chat

Compiling samlet-chat is as simple as cloning the repository and running `make`.

```bash
$ git clone hhttps://github.com/samletnorge/samlet-chat.git
$ cd samlet-chat
$ make prod
```

This will automatically fetch dependencies (Go and Yarn) and compile the project. The first `make` might be slow; future builds will be much faster as you wouldn't have to pull all the dependencies. After the command completes, your binary would be available at `./build/prod/samlet-chat` along with other files.

{% hint style='tip' %}
If you're not running samlet-chat in a production environment, you may want to use `make devel` instead of `make prod` for more descriptive frontend errors. Substitute `./build/prod` with `./build/devel` appropriately.
{% endhint %}

#### Launching samlet-chat

{% include "launching-samlet-chat-pre.md" %}

```bash
$ ./build/prod/samlet-chat
```

{% include "launching-samlet-chat-post.md" %}
