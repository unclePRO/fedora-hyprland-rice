#!/bin/bash
echo "Synchronizing Chronosync Environment..."

# install dependencies
sudo dnf install -y hyprland hyprpaper hypridle hyprlock waybar wofi mako \
kitty brave-browser thunar gvfs-mtp wireplumber brightnessctl playerctl \
ImageMagick bibata-cursor-themes network-manager-applet blueman \
lxqt-policykit grim slurp wl-clipboard wf-recorder nwg-look qt6ct \
xdg-desktop-portal-hyprland jetbrains-mono-fonts-all fontawesome-fonts-all

# making cursor theme
mkdir -p ~/.local/share/icons/ChronoSync-Red/cursors
cp -r /usr/share/icons/Bibata-Modern-Amber/* ~/.local/share/icons/ChronoSync-Red/
mogrify -path ~/.local/share/icons/ChronoSync-Red/cursors/ -format png 'left_ptr.png' -bordercolor black -border 2x2
cat > ~/.local/share/icons/ChronoSync-Red/index.theme << EOF
[Icon Theme]
Name=ChronoSync-Red
Inherits=Bibata-Modern-Amber
EOF

# final step
mkdir -p ~/.config
ln -sf $(pwd)/config/hypr ~/.config/
ln -sf $(pwd)/config/waybar ~/.config/
ln -sf $(pwd)/config/kitty ~/.config/
ln -sf $(pwd)/config/wofi ~/.config/
ln -sf $(pwd)/config/mako ~/.config/

echo "✅ System Sychronized. Log out and select Hyprland session."