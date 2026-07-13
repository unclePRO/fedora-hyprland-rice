#!/bin/bash

# ==============================================================================
# Unclepro's Uninstaller & Cleanup Script (Fedora)
# ==============================================================================

echo "⚠️⚠️⚠️  WARNING: This will completely remove Hyprland, all associated packages, and your config files."
echo "Do not run this while logged into a Hyprland session!"
read -p "Are you sure you want to proceed? (y/N): " confirm

if [[ "$confirm" != [yY] && "$confirm" != [yY][eE][sS] ]]; then
    echo "Aborting cleanup."
    exit 1
fi

echo "=============================================================================="
echo "### Starting cleanup process..."
echo "=============================================================================="

# 1. Nuke the Config Folders
echo "=============================================================================="
echo "### Removing configuration directories..."
echo "=============================================================================="
rm -rf ~/.config/hypr \
       ~/.config/waybar \
       ~/.config/kitty \
       ~/.config/swaync \
       ~/.config/cava \
       ~/.config/wofi \
       ~/.config/fastfetch \
       ~/.config/scripts \
       ~/.config/wallpapers \
       ~/.config/wlogout

# 2. Remove the Custom Cursor
echo "=============================================================================="
echo "### Removing ChronoSync-Red cursor..."
echo "=============================================================================="
rm -rf ~/.local/share/icons/ChronoSync-Red

# 3. Clean up .bashrc Injections
echo "=============================================================================="
echo "### Cleaning up .bashrc..."
echo "=============================================================================="
# Removes the exact lines injected by the install script
sed -i '/# Launch Fastfetch on terminal start/d' ~/.bashrc
sed -i '/fastfetch -c ~\/.config\/fastfetch\/config.json/d' ~/.bashrc
sed -i '/# Minimal Glassy Indigo Prompt/d' ~/.bashrc
sed -i '/export PS1="\\\[\\e\[1;35m\\\]\\w ❯\\\[\\e\[0m\\\] "/d' ~/.bashrc

# 4. Remove Flatpaks & Local Binaries
echo "=============================================================================="
echo "### Removing Flatpaks and local binaries..."
echo "=============================================================================="
flatpak uninstall -y io.missioncenter.MissionCenter
rm -f ~/.local/bin/battop

# 5. Uninstall DNF Packages
echo "=============================================================================="
echo "### Uninstalling Hyprland and ricing packages..."
echo "=============================================================================="

sudo dnf remove -y \
    hyprland \
    hyprpaper \
    hyprlock \
    hypridle \
    waybar \
    swaync \
    nwg-look \
    wofi \
    wlogout \
    fastfetch \
    btop \
    cava \
    grim \
    slurp \
    wl-clipboard \
    playerctl \
    brightnessctl

# 6. Clean up orphaned dependencies
echo "### Removing orphaned dependencies..."
sudo dnf autoremove -y

echo "=============================================================================="
echo "✅ Cleanup Complete! Hyprland is removed from your system."
echo "=============================================================================="