# Samlet-Chat Theming Guide

Samlet-Chat now supports flexible theming and styling to seamlessly integrate with your application's design system. This guide explains how to customize the appearance of the chat widget.

## Overview

The chat widget supports three levels of customization:

1. **Dark/Light Mode** - Automatic or manual color scheme switching
2. **Theme Presets** - Pre-configured color schemes  
3. **Host Inheritance** - Automatically inherit styles from your application
4. **Custom CSS Override** - Full control with custom CSS

## Quick Start

### Basic Usage (Default Theme)

```html
<script defer src="https://your-server.com/js/samlet-chat.js"></script>
<div id="samlet-chat"></div>
```

### Dark Mode

Enable dark mode explicitly:

```html
<script defer 
  src="https://your-server.com/js/samlet-chat.js" 
  data-mode="dark">
</script>
<div id="samlet-chat"></div>
```

### Auto Dark Mode (System Preference)

Automatically follow the user's system preference:

```html
<script defer 
  src="https://your-server.com/js/samlet-chat.js" 
  data-mode="auto">
</script>
<div id="samlet-chat"></div>
```

### Theme Presets

Use one of the built-in theme presets:

```html
<script defer 
  src="https://your-server.com/js/samlet-chat.js" 
  data-theme="blue">
</script>
<div id="samlet-chat"></div>
```

Available presets:
- `blue` - Blue primary color
- `green` - Green primary color  
- `purple` - Purple primary color
- `red` - Red primary color
- `orange` - Orange primary color
- `cyan` - Cyan primary color
- `dark` - Dark theme (equivalent to `data-mode="dark"`)

### Inherit from Host Application

Automatically inherit your application's color scheme:

```html
<script defer 
  src="https://your-server.com/js/samlet-chat.js" 
  data-theme="inherit">
</script>
<div id="samlet-chat"></div>
```

When using `data-theme="inherit"`, the widget will look for CSS custom properties in your application:

- `--primary` or `--primary-color` - Primary/accent color
- `--primary-dark` or `--primary-600` - Darker primary variant
- `--text-primary` or `--text-color` - Primary text color
- `--text-secondary` or `--text-muted` - Secondary text color
- `--bg-primary` or `--background` - Primary background
- `--bg-secondary` or `--background-secondary` - Secondary background
- `--border-color` or `--border` - Border color

Example host application CSS:

```css
:root {
  --primary-color: #3b82f6;
  --text-color: #1f2937;
  --background: #ffffff;
  --border: #e5e7eb;
}
```

## Combining Options

You can combine mode and theme:

```html
<!-- Blue theme with dark mode -->
<script defer 
  src="https://your-server.com/js/samlet-chat.js" 
  data-theme="blue"
  data-mode="dark">
</script>
<div id="samlet-chat"></div>
```

## Advanced Customization

### Custom CSS Override

For complete control, provide a custom CSS file:

```html
<script defer 
  src="https://your-server.com/js/samlet-chat.js" 
  data-css-override="https://your-server.com/custom-chat-styles.css">
</script>
<div id="samlet-chat"></div>
```

### Override Individual CSS Variables

You can override individual CSS custom properties in your application's CSS:

```css
#samlet-chat {
  --samlet-primary: #8b5cf6;
  --samlet-primary-600: #7c3aed;
  --samlet-border-primary: #e0e7ff;
}
```

### Complete List of CSS Custom Properties

#### Primary Colors
- `--samlet-primary` - Primary/accent color (default: #ffd700)
- `--samlet-primary-50` through `--samlet-primary-900` - Primary color shades
- `--samlet-primary-text` - Text color on primary background

#### Neutral Colors
- `--samlet-neutral-50` through `--samlet-neutral-900` - Grayscale palette

#### Semantic Colors
- `--samlet-success`, `--samlet-success-text` - Success states
- `--samlet-warning`, `--samlet-warning-text` - Warning states
- `--samlet-destructive`, `--samlet-destructive-text` - Error/destructive states
- `--samlet-info`, `--samlet-info-text` - Informational states

#### Text Colors
- `--samlet-text-primary` - Primary text
- `--samlet-text-secondary` - Secondary text
- `--samlet-text-tertiary` - Tertiary text
- `--samlet-text-inverse` - Inverse text (for dark backgrounds)
- `--samlet-text-muted` - Muted/placeholder text

#### Background Colors
- `--samlet-bg-primary` - Primary background
- `--samlet-bg-secondary` - Secondary background
- `--samlet-bg-tertiary` - Tertiary background

#### Border Colors
- `--samlet-border-primary` - Primary borders
- `--samlet-border-secondary` - Secondary borders
- `--samlet-border-focus` - Focus state border

## Dynamic Theme Switching (SPA)

For Single Page Applications, you can dynamically change the theme:

```javascript
// Initialize with default theme
window.chat.main();

// Later, switch to dark mode
window.chat.reInit({
  mode: 'dark'
});

// Switch to blue theme
window.chat.reInit({
  theme: 'blue'
});

// Switch to light mode with green theme
window.chat.reInit({
  mode: 'light',
  theme: 'green'
});
```

## Complete Data Attributes Reference

All available data attributes for the script tag:

- `data-theme` - Theme preset: `blue`, `green`, `purple`, `red`, `orange`, `cyan`, `dark`, `inherit`, or `auto`
- `data-mode` - Color scheme mode: `light`, `dark`, or `auto`
- `data-css-override` - URL to custom CSS file
- `data-page-id` - Unique identifier for the page/thread
- `data-id-root` - Root element ID (default: `samlet-chat`)
- `data-no-fonts` - Disable custom fonts (`true`/`false`)
- `data-auto-init` - Auto-initialize on load (`true`/`false`)
- `data-no-websockets` - Disable WebSocket live updates (`true`/`false`)
- `data-no-livereload` - Disable all live reload (`true`/`false`)
- `data-hide-deleted` - Hide deleted comments completely (`true`/`false`)
- `data-locale` - Language locale code

## Examples

### Corporate Website with Brand Colors

```html
<style>
  #samlet-chat {
    --samlet-primary: #1a73e8;
    --samlet-primary-600: #1557b0;
  }
</style>
<script defer src="https://your-server.com/js/samlet-chat.js"></script>
<div id="samlet-chat"></div>
```

### Dark Mode Blog

```html
<script defer 
  src="https://your-server.com/js/samlet-chat.js" 
  data-mode="dark"
  data-theme="purple">
</script>
<div id="samlet-chat"></div>
```

### React Application with Dynamic Theming

```jsx
import React, { useEffect } from 'react';

const Chat = ({ theme = 'light', colorScheme = 'blue' }) => {
  useEffect(() => {
    if (typeof window !== 'undefined' && !window.chat) {
      window.chat = {};
      const script = document.createElement('script');
      script.src = 'https://your-server.com/js/samlet-chat.js';
      script.defer = true;
      script.setAttribute('data-auto-init', 'false');
      script.setAttribute('data-id-root', 'samlet-chat-box');
      script.onload = () => {
        window.chat.main();
      };
      document.getElementsByTagName('head')[0].appendChild(script);
    } else if (typeof window !== 'undefined' && window.chat) {
      window.chat.reInit({
        mode: theme,
        theme: colorScheme,
      });
    }
  }, [theme, colorScheme]);

  return <div id="samlet-chat-box" />;
};

export default Chat;
```

### Inherit from Tailwind CSS

```html
<style>
  :root {
    --primary: theme('colors.blue.500');
    --primary-dark: theme('colors.blue.600');
    --text-primary: theme('colors.gray.900');
    --background: theme('colors.white');
    --border: theme('colors.gray.200');
  }
  
  .dark {
    --text-primary: theme('colors.gray.50');
    --background: theme('colors.gray.900');
    --border: theme('colors.gray.700');
  }
</style>
<script defer 
  src="https://your-server.com/js/samlet-chat.js" 
  data-theme="inherit">
</script>
<div id="samlet-chat"></div>
```

## Browser Support

- All modern browsers (Chrome, Firefox, Safari, Edge)
- CSS Custom Properties (CSS Variables) support required
- `prefers-color-scheme` media query for auto dark mode (gracefully degrades if not supported)

## Migration from Previous Versions

If you were using `data-css-override` in previous versions, it continues to work as before. The new theming system is additive and doesn't break existing implementations.

To migrate to the new system:

1. Remove `data-css-override` if you were only using it for color customization
2. Use `data-theme` or `data-mode` for simple color scheme changes
3. Use CSS custom properties for fine-grained control
4. Keep `data-css-override` only if you need structural/layout changes

## Troubleshooting

### Theme not applying?

1. Check browser console for errors
2. Ensure `data-theme` value is spelled correctly
3. Verify the widget has loaded completely

### Inherit mode not working?

1. Ensure your application defines the CSS custom properties
2. Check that properties are defined on `:root` or a parent element
3. Verify property names match the expected format

### Colors look wrong in dark mode?

1. Explicitly set `data-mode="dark"` if auto-detection isn't working
2. Check that your custom CSS doesn't override dark mode styles
3. Verify contrast ratios for accessibility

## Support

For issues or questions:
- GitHub Issues: https://github.com/samletnorge/samlet-chat/issues
- Documentation: https://docs.samlet-chat.valiantlynx.com
