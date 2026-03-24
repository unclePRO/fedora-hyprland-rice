# Fedora + Hyprland rice
> A high-performance, focus-oriented Hyprland environment for Fedora 43.

## Design Philosophy: Chronosync
The Chronosync environment is a specialized desktop workspace built for high-stakes development cycles, specifically optimized for the Fedora 43 ecosystem. As a developer in a technical academic environment, the focus is on **"Visual Synchronization"**—the concept that the desktop should feel like an immediate extension of the user's thought process.

The **Red Focus** color palette utilizes high-contrast gradients (`rgba(ff7a3cff)` and `rgba(ff3c6aff)`) to emphasize the active task while peripheral windows recede into the background. A core technical feature is the **"Main Character" dispatcher**. By implementing a custom toggle that forces a 60% viewport width in a floating state, Chronosync ensures that web-based AI tools maintain their desktop layout, effectively solving the "scroll-jump" bug common in dynamic tiling layouts. This creates a dual-workflow: deep focus on the left (the Main Character) and secondary terminals or documentation on the right.

The system leverages a purely native Wayland stack to minimize input latency. The status bar, powered by **Waybar v0.14.0**, is stripped of clutter and configured with hardware-agnostic network modules to ensure compatibility with competition requirements. The integration of a custom-built cursor theme, **ChronoSync-Red**, reinforces the theme and ensures the pointer remains trackable against vibrant window borders.

---

## System Dependencies (Fedora 43)

Install these packages via `dnf` to ensure the **Red Focus** environment and all custom scripts function as intended.

### 1. Core Compositor & System
| Component | Package Name | Purpose |
| :--- | :--- | :--- |
| **Window Manager** | `hyprland` | Core tiling compositor and logic engine. |
| **Wallpaper** | `hyprpaper` | Minimalist wallpaper management. |
| **Idle & Lock** | `hypridle`, `hyprlock` | Handles system sleep and "Chronosync-Red" lockscreen. |
| **Wayland Portal** | `xdg-desktop-portal-hyprland` | Required for screen sharing, recording, and global shortcuts. |

### 2. UI & User Interaction
| Component | Package Name | Purpose |
| :--- | :--- | :--- |
| **Status Bar** | `waybar` | The central "Pill" style status bar. |
| **App Launcher** | `wofi` | The `$menu` dispatcher with custom prompt logic. |
| **Notifications** | `mako` | Lightweight notification daemon for system alerts. |
| **Auth Agent** | `lxqt-policykit` | Handles root/sudo permission popups. |
| **Tray Applets** | `network-manager-applet`, `blueman` | Ethernet and Bluetooth connectivity modules. |

### 3. Applications & File Management
| Component | Package Name | Purpose |
| :--- | :--- | :--- |
| **Terminal** | `kitty` | High-performance terminal with blur/glass support. |
| **Web Browser** | `brave-browser` | Native Wayland build for optimized AI workflows. |
| **File Manager** | `thunar` | Lightweight GTK file management. |
| **USB/MTP** | `gvfs-mtp` | Required for mounting external drives and mobile devices. |

### 4. Media & Hardware Control
| Component | Package Name | Purpose |
| :--- | :--- | :--- |
| **Audio** | `wireplumber` | Provides `wpctl` for precise volume binds. |
| **Backlight** | `brightnessctl` | Hardware-level screen brightness adjustment. |
| **Media Sync** | `playerctl` | Unified control for music and video playback. |

### 5. Capture & Scripting Utilities
| Component | Package Name | Purpose |
| :--- | :--- | :--- |
| **Screenshots** | `grim`, `slurp` | Area and full-screen image capture. |
| **Clipboard** | `wl-clipboard` | Seamless copy-paste synchronization for Wayland. |
| **Recording** | `wf-recorder` | Engine for the custom `F12` screen recording scripts. |

### 6. Theming & Typography
| Component | Package Name | Purpose |
| :--- | :--- | :--- |
| **Graphic Engine** | `ImageMagick` | Required for `mogrify` cursor border modifications. |
| **Cursor Base** | `bibata-cursor-themes` | The amber base for the "ChronoSync-Red" cursor. |
| **Theme Control** | `nwg-look`, `qt6ct` | Synchronizes GTK and Qt app appearances with the red theme. |
| **Typography** | `jetbrains-mono-fonts-all` | Clean, readable mono fonts for code and UI. |
| **Iconography** | `fontawesome-fonts-all` | Scalable icons for the Waybar and Wofi modules. |

## External Repositories
For icons to render correctly in the status bar, you **must** enable the following COPR for Nerd Font support:

```bash
sudo dnf copr enable maveonair/jetbrains-mono-nerd-fonts
sudo dnf install jetbrains-mono-nerd-fonts
```
Run `install.sh` to install required dependencies as well as to create cursor theme (install manually if fails).
If cursor theme is having problems, use Bibata-Modern-Amber cursor:

```bash
hyprctl setcursor Bibata-Modern-Amber 24
```

## IMPORTANT!

- In `hyprlock.conf` -> line 10: add your wallpaper location.
- In `hyprpaper.conf` -> add your wallpaper location in place for both the already given ones for it to work.
- If wofi does not appear to be red (chronosync theme), fix this in `~/.config/wofi/config` -> line 12: style = "location of style.css". 