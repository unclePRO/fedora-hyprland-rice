#!/bin/bash
set -e

# ==============================================================================
# unclePRO's Hyprland Setup - Dependency Installer (Fedora)
# ==============================================================================

echo " ### Starting dependency installation for the Glassy Indigo setup..."

# 1. Update the system first
echo "### Updating system packages..."
sudo dnf update -y

# 2. Core Desktop Environment & Daemons
echo "### Installing Hyprland ecosystem and core daemons..."
sudo dnf install -y \
    hyprland \
    hyprpaper \
    hyprlock \
    hypridle \
    waybar \
    swaync \
    nwg-look \
    wofi \
    lxqt-policykit \
    wlogout

# 3. Terminal, File Manager, & System Monitors
echo "### Installing terminal, file manager, and CLI utilities..."
sudo dnf install -y \
    kitty \
    thunar \
    fastfetch \
    btop \
    cava

# 4. Audio, Network, & Bluetooth Applets
echo "### Installing system applets and controls..."
sudo dnf install -y \
    network-manager-applet \
    blueman \
    pavucontrol \
    wireplumber

# 5. Background Utilities (Screenshots, Brightness, Media)
echo "### Installing screenshot and media utilities..."
sudo dnf install -y \
    grim \
    slurp \
    wl-clipboard \
    playerctl \
    brightnessctl

# 6. Flatpak Applications (Mission Center)
echo "### Installing Mission Center via Flatpak..."
# Ensure flatpak and flathub are set up
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub io.missioncenter.MissionCenter

# downloading battop
echo "### Installing battop (Local User)..."
mkdir -p ~/.local/bin
wget -q --show-progress -O ~/.local/bin/battop https://github.com/svartalf/rust-battop/releases/download/v0.2.4/battop-v0.2.4-x86_64-unknown-linux-gnu
chmod +x ~/.local/bin/battop

# 7. Nerd Fonts (Crucial for Waybar icons)
echo "### Installing JetBrains Mono Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
cd /tmp
wget -q --show-progress https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -q JetBrainsMono.zip -d "$FONT_DIR"
rm JetBrainsMono.zip
fc-cache -fv

# 8. Install the Custom Cursor
echo "### Installing ChronoSync-Red cursor..."
mkdir -p ~/.local/share/icons
if [ -d "cursors/ChronoSync-Red" ]; then
    cp -r cursors/ChronoSync-Red ~/.local/share/icons/
else
    echo "❌ Cursor folder not found! Make sure you are running this from the correct directory."
    exit 1
fi
echo "=============================================================================="
echo "✅✅✅ All dependencies and assets installed successfully!✅✅✅"
echo "=============================================================================="