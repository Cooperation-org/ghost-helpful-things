/**
 * Social Share JavaScript
 * Handles Mastodon instance selection for sharing
 */

function shareMastodon(title, url) {
    const instance = prompt("Enter your Mastodon instance (e.g., mastodon.social):");
    if (instance) {
        // Clean up the instance URL
        const cleanInstance = instance.replace(/^https?:\/\//, '').replace(/\/$/, '');
        const text = encodeURIComponent(title + " " + url);
        window.open(`https://${cleanInstance}/share?text=${text}`, "_blank", "noopener");
    }
}

// Alternative implementation with saved instance
function shareMastodonWithMemory(title, url) {
    // Try to get saved instance from localStorage
    let instance = localStorage.getItem('mastodon_instance');
    
    if (!instance) {
        instance = prompt("Enter your Mastodon instance (e.g., mastodon.social):");
        if (instance) {
            // Save for next time
            localStorage.setItem('mastodon_instance', instance);
        }
    }
    
    if (instance) {
        const cleanInstance = instance.replace(/^https?:\/\//, '').replace(/\/$/, '');
        const text = encodeURIComponent(title + " " + url);
        window.open(`https://${cleanInstance}/share?text=${text}`, "_blank", "noopener");
    }
}