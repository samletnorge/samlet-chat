### Using Release Binaries

#### Download and Install

Installing using release binaries can be done in two ways &ndash; using your operating system's package manager or downloading the release binary archive. If available, the former is recommended because it allows for cleaner updates and removal.

##### Using Your Package Manager

With this approach, your package manager will take care of downloading and installing samlet-chat's files on your system. The samlet-chat binary will be installed to a standard path, so launching samlet-chat is as simple as executing `samlet-chat` from a shell. Read the [next section](#launching-samlet-chat) on launching samlet-chat to learn more about setting up some non-optional environment variables.

Unfortunately, samlet-chat is not currently available on some distributions; in the event this applies to you, use the [second method](#using-release-binary-archives). If you would like to help package and maintain the package for your favourite distribution, please feel free to do so. Here are the documented installation steps for some distributions.


##### Using Release Binary Archives

Find the latest release archive for your operating system from the [releases page](/getting-started/self-hosting/releases.md). For example, if you were using Linux on an `amd64` processor (also known as `x86-64`) and wanted to download the `v1.4.0` release, you would download the `samlet-chat-linux-amd64-v1.4.0.tar.gz` file.

```bash
$ wget https://samlet-chat-release.s3.amazonaws.com/samlet-chat-linux-amd64-v1.4.0.tar.gz
$ tar xvf samlet-chat-linux-amd64-v1.4.0.tar.gz -C /path/to/installation/
```

To launch samlet-chat, you need to execute the binary available at `/path/to/installation/samlet-chat`. Read the next section on how to set up some non-optional environment variables.

#### Launching samlet-chat

{% include "launching-samlet-chat-pre.md" %}

```bash
$ /path/to/installation/samlet-chat
```

{% include "launching-samlet-chat-post.md" %}
