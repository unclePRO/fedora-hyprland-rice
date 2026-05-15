#!/bin/bash

# ==============================================================================
# Uncle PRO's Glassy Indigo Hyprland Setup - Dependency Installer (Fedora)
# ==============================================================================

echo "⚡ Starting dependency installation for the Glassy Indigo setup..."

# 1. Update the system first
echo "🔄 Updating system packages..."
sudo dnf update -y

# 2. Core Desktop Environment & Daemons
echo "🖥️ Installing Hyprland ecosystem and core daemons..."
sudo dnf install -y \
    hyprland \
    hyprpaper \
    hyprlock \
    hypridle \
    waybar \
    mako \
    wofi \
    lxqt-policykit 

# 3. Terminal, File Manager, & System Monitors
echo "🪟 Installing terminal, file manager, and CLI utilities..."
sudo dnf install -y \
    kitty \
    thunar \
    fastfetch \
    btop

# 4. Audio, Network, & Bluetooth Applets
echo "🔊 Installing system applets and controls..."
sudo dnf install -y \
    network-manager-applet \
    blueman \
    pavucontrol \
    wireplumber

# 5. Background Utilities (Screenshots, Brightness, Media)
echo "📸 Installing screenshot and media utilities..."
sudo dnf install -y \
    grim \
    slurp \
    wl-clipboard \
    playerctl \
    brightnessctl

# 6. Flatpak Applications (Mission Center)
echo "📊 Installing Mission Center via Flatpak..."
# Ensure flatpak and flathub are set up
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub io.missioncenter.MissionCenter

# 7. Nerd Fonts (Crucial for Waybar icons)
echo "🔡 Installing JetBrains Mono Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
cd /tmp
wget -q --show-progress https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -q JetBrainsMono.zip -d "$FONT_DIR"
rm JetBrainsMono.zip
fc-cache -fv

echo "✅ All dependencies installed successfully!"
echo "⚠️  NOTE: Don't forget to copy the ChronoSync-Red cursor folder to ~/.local/share/icons/ and make your scripts executable (chmod +x)!"
