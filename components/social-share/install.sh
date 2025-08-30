#!/bin/bash

# Social Share Component Installer
# For Ghost themes

echo "Ghost Social Share Component Installer"
echo "======================================="
echo ""

# Check if theme path is provided
if [ -z "$1" ]; then
    echo "Usage: ./install.sh /path/to/your/ghost/theme"
    echo ""
    echo "Example: ./install.sh /var/www/ghost/content/themes/casper"
    exit 1
fi

THEME_PATH="$1"

# Check if theme path exists
if [ ! -d "$THEME_PATH" ]; then
    echo "Error: Theme directory not found: $THEME_PATH"
    exit 1
fi

# Check for partials directory
if [ ! -d "$THEME_PATH/partials" ]; then
    echo "Error: No partials directory found in theme"
    echo "This component requires a theme with partials support"
    exit 1
fi

# Create icons directory if it doesn't exist
if [ ! -d "$THEME_PATH/partials/icons" ]; then
    echo "Creating icons directory..."
    mkdir -p "$THEME_PATH/partials/icons"
fi

# Copy files
echo "Installing social share component..."
cp social-share.hbs "$THEME_PATH/partials/"
cp icons/*.hbs "$THEME_PATH/partials/icons/"

echo ""
echo "✓ Files copied successfully!"
echo ""
echo "Next steps:"
echo "1. Add {{> \"social-share\"}} to your post template where you want the buttons"
echo "2. Add the JavaScript function from social-share.js to your post template"
echo "3. Restart Ghost: ghost restart"
echo ""
echo "See README.md for detailed instructions"