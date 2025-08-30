# Social Share Component

Adds Bluesky and Mastodon share buttons to your Ghost theme's existing share bar.

## What it does

- Adds a Bluesky share button (opens compose window with post title and URL)
- Adds a Mastodon share button (prompts for instance, then opens share dialog)
- Preserves your existing share buttons

## Files

- `social-share.hbs` - Share button template snippet
- `social-share.js` - JavaScript for Mastodon instance handling
- `icons/` - SVG icons for Bluesky and Mastodon
- `install.sh` - Installation helper script

## Manual Installation

### 1. Add Icons

Copy the icon files to your theme's partials/icons directory:

```bash
cp icons/*.hbs /path/to/your-theme/partials/icons/
```

### 2. Update Your Post Template

Find where your theme defines social sharing (usually in `post.hbs` or `partials/article.hbs`).

Look for existing share buttons like:
```handlebars
<a href="https://twitter.com/intent/tweet...
```

Add these after your last social button:

```handlebars
{{> "social-share"}}
```

### 3. Add JavaScript

Add the Mastodon handler to your post template's script section:

```javascript
function shareMastodon(title, url) {
    const instance = prompt("Enter your Mastodon instance (e.g., mastodon.social):");
    if (instance) {
        const text = encodeURIComponent(title + " " + url);
        window.open(`https://${instance}/share?text=${text}`, "_blank", "noopener");
    }
}
```

### 4. Restart Ghost

```bash
ghost restart
```

## Compatibility

Tested with:
- Ghost 5.x, 6.x
- Casper theme
- Source theme  
- Newspaper theme
- London theme

## Customization

Edit `social-share.hbs` to:
- Change button order
- Modify icons
- Add more platforms