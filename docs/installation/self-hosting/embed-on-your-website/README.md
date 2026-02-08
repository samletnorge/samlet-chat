### Embedding samlet-chat

At this point, you should have the registered your website with samlet-chat. Now all that's left is embedding samlet-chat on your website. This is the step that actually allows your readers to add comments.

At the moment samlet-chat only supports a [universal HTML tag](universal-tag.md). In the future there will be support for more publishing platforms such as Wordpress, Blogger, Wix, and Ghost. 

If your samlet-chat instance is available at `samlet-chat.example.com`, embed the following piece of HTML in your website wherever you want samlet-chat to load. You may want to do this at the bottom of each post.

```html
<div id="samlet-chat"></div>
<script defer
  src="https://raw.githubusercontent.com/samletnorge/samlet-chat/refs/heads/master/frontend/js/samlet-chat.js">
</script>
```

{% hint style='tip' %}
samlet-chat uses JavaScript to dynamically fetch and display comments. You may want to add a `<noscript>` tag in case the user has disabled JavaScript in their web browser to let them know that. For example, add the following after the `<script>` snippet.

```html
<noscript>Please enable JavaScript to load the comments.</noscript>
```
{% endhint %}
