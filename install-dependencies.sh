#!/bin/bash
set -e

# ==============================================================================
# Uncle PRO's Glassy Indigo Hyprland Setup - Dependency Installer (Fedora)
# ==============================================================================

echo "### Starting full dependency installation for the Glassy Indigo setup..."

# 1. Full System Update
echo "### Updating system packages..."
sudo dnf upgrade -y

# 2. Enable Required Repositories
echo "### Enabling community repositories..."
sudo dnf install -y dnf-plugins-core flatpak
sudo dnf copr enable -y solopasha/hyprland

# 3. Core Desktop Environment & Daemons
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

# 4. Terminal, File Manager, & System Monitors
echo "### Installing terminal, file manager, and CLI utilities..."
sudo dnf install -y \
    kitty \
    thunar \
    fastfetch \
    btop \
    cava

# 5. Audio, Network, & Bluetooth Applets
echo "### Installing system applets and controls..."
sudo dnf install -y \
    network-manager-applet \
    blueman \
    pavucontrol \
    wireplumber

# 6. Background Utilities (Screenshots, Brightness, Media)
echo "### Installing screenshot and media utilities..."
sudo dnf install -y \
    grim \
    slurp \
    wl-clipboard \
    playerctl \
    brightnessctl

# 7. Flatpak Applications (Mission Center)
echo "### Installing Mission Center via Flatpak..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub io.missioncenter.MissionCenter

# 8. Download battop
echo "### Installing battop (Local User)..."
mkdir -p ~/.local/bin
wget -q --show-progress -O ~/.local/bin/battop https://github.com/svartalf/rust-battop/releases/download/v0.2.4/battop-v0.2.4-x86_64-unknown-linux-gnu
chmod +x ~/.local/bin/battop

# 9. Nerd Fonts (Crucial for Waybar icons)
echo "### Installing JetBrains Mono Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
cd /tmp
wget -q --show-progress https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -q JetBrainsMono.zip -d "$FONT_DIR"
rm JetBrainsMono.zip
fc-cache -fv

echo "=============================================================================="
echo "✅✅✅ All dependencies installed successfully! ✅✅✅"
echo "### Next step: Run ./install-dotfiles.sh to apply the Glassy Indigo theme."
echo "=============================================================================="