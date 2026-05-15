# 🌌 Glassy Indigo | Hyprland Setup
**A premium, hyper-optimized Wayland environment.**

*(Tip: Replace this placeholder with an imgur or github link to a sick screenshot of your desktop!)*

Welcome to **Glassy Indigo**. This isn't just a collection of config files; it's a complete, automated setup designed to transform a fresh Fedora installation into a stunning, minimalist, and highly functional cyberpunk workspace. 

Built with a focus on deep system integration, this rice features a custom Macbook-style floating Waybar, transparent blur effects, intelligent power management, and a zero-clutter terminal experience.

---

## ⚡ Features

* **Window Manager:** Hyprland (Smooth animations, glassy borders, Wayland native)
* **Bar:** Waybar (Custom thin, floating Macbook-style with purple/indigo accents)
* **Terminal:** Kitty (Configured for speed and minimal aesthetics)
* **Shell:** Bash (Featuring a custom, ultra-minimal `➜` prompt + Fastfetch auto-start)
* **App Launcher:** Wofi (Styled to match the glassy aesthetic)
* **Notifications:** Mako (Sleek, unobtrusive popups)
* **Power Management:** Hypridle & Hyprlock (Smart 5-minute lock & 10-minute suspend)
* **System Monitor:** Btop & Mission Center (Flatpak)

---

## ⚠️ OS Compatibility (CRITICAL)

**This setup is explicitly optimized and strictly tested for Fedora 43.** Why not Fedora 44? 
Fedora 44 is currently experiencing upstream dependency conflicts with the newest Wayland/Aquamarine libraries in the community repositories. To guarantee a flawless, crash-free, one-click installation, this script targets the rock-solid stability of **Fedora 43**. 

*(If you are on Fedora 44, please downgrade or wait for upstream F44 packages to stabilize before purchasing/installing).*

---

## 🛠️ Installation Guide

I have engineered this setup to be as "plug-and-play" as humanly possible. No manual compiling, no hunting down missing fonts. The scripts do all the heavy lifting.

### Step 1: Prepare your system
Ensure you are on a fresh installation of **Fedora 43**. Open your default terminal and navigate to where you extracted this folder:
```bash
cd Downloads/uncle-hyprland-dotfiles
```

### Step 2: Run the Dependency Installer
This script handles the full system update, enables the necessary Copr (`solopasha/hyprland`) and Flathub repositories, and securely downloads all required packages. 
```bash
chmod +x install_dependencies.sh
./install_dependencies.sh
```
*Note: This script uses strict error-catching. If your internet drops, it will safely halt rather than breaking your system.*

### Step 3: Apply the Magic
Once dependencies are installed, run the dotfiles script. This will safely copy all configurations, set up your fonts, and configure your minimal terminal prompt.
```bash
chmod +x install_dotfiles.sh
./install_dotfiles.sh
```

### Step 4: Boot into Glassy Indigo
1. Log out of your current desktop session.
2. At the login screen, select **Hyprland** from the desktop session menu (usually a gear icon in the corner).
3. Log in and enjoy!

---

## ⌨️ Essential Keybinds
* `SUPER + Enter` : Open Kitty Terminal
* `SUPER + Space` : Open Wofi (App Launcher)
* `SUPER + Q` : Close active window
* `SUPER + M` : Exit Hyprland safely
* `Print Screen` : Custom screenshot selection (saves to `~/Pictures`)

---

## ☕ Support the Developer
If you are enjoying this setup and the automation scripts saved you hours of debugging, consider supporting my work! Building and maintaining custom system architectures takes a lot of coffee. 

**[Support me on Ko-fi!](https://kofi.com/unclepro)**

---
*Built with 💜 by Uncle PRO*