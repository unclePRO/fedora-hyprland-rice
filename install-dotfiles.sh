#!/bin/bash

# ==============================================================================
# Uncle PRO's Glassy Indigo - Dotfiles & Theme Installer
# ==============================================================================

echo "🚀 Starting installation of Uncle PRO's Glassy Indigo environment..."

# 1. Create necessary destination directories
echo "📁 Creating configuration directories..."
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/kitty
mkdir -p ~/.config/mako
mkdir -p ~/.config/wofi
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/scripts
mkdir -p ~/.config/wallpapers
mkdir -p ~/.local/share/icons

# 2. Copy the Config Files & Assets
echo "⚙️ Copying configuration files to ~/.config/..."
cp -r config/hypr/* ~/.config/hypr/
cp -r config/waybar/* ~/.config/waybar/
cp -r config/kitty/* ~/.config/kitty/
cp -r config/mako/* ~/.config/mako/
cp -r config/wofi/* ~/.config/wofi/
cp -r config/fastfetch/* ~/.config/fastfetch/
cp -r config/scripts/* ~/.config/scripts/
cp -r config/wallpapers/* ~/.config/wallpapers/

# 3. Install the Custom Cursor
echo "🖱️ Installing ChronoSync-Red cursor..."
if [ -d "cursors/ChronoSync-Red" ]; then
    cp -r cursors/ChronoSync-Red ~/.local/share/icons/
    echo "✔️ Cursor installed successfully!"
else
    echo "⚠️ Cursor folder not found! Make sure you are running this from the uncle-hyprland-dotfiles directory."
fi

# 4. Make all scripts executable
echo "🔧 Setting permissions for your custom scripts..."
if [ -d "$HOME/.config/scripts" ]; then
    chmod +x ~/.config/scripts/*.sh
    echo "✔️ Scripts made executable!"
fi

# 5. Reload Services
echo "🔄 Reloading services to apply changes..."
if pgrep -x "mako" > /dev/null; then
    makoctl reload
fi


echo "⚙️ Configuring terminal prompt and Fastfetch..."

# 1. Add Fastfetch to startup (Checks if it's already there to prevent duplicates)
if ! grep -q "fastfetch" ~/.bashrc; then
    echo -e "\n# Launch Fastfetch on terminal start\nfastfetch -c ~/.config/fastfetch/config.json" >> ~/.bashrc
fi

if ! grep -q "export PS1" ~/.bashrc; then
    echo -e "\n# Minimal Glassy Indigo Prompt" >> ~/.bashrc
    echo 'export PS1="\[\e[1;35m\]\w ❯\[\e[0m\] "' >> ~/.bashrc
fi

echo "=============================================================================="
echo "🎉 Installation Complete!"
echo "If you are currently using Hyprland, press [SUPER + SHIFT + R] to reload."
echo "If you are setting this up for the first time, log out and select Hyprland from your display manager."
echo "=============================================================================="
