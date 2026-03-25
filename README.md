# Fedora + Hyprland rice
> A high-performance, focus-oriented Hyprland environment for Fedora 43.

## Preview

https://github.com/user-attachments/assets/7f4af73b-e20c-4a7f-8051-e8d3f9e6a63d

## Theme: Chronosync

This rice is a technical environment optimized for high-intensity development cycles within the Fedora 43 ecosystem. The architecture is centered on **"Visual Synchronization"**—a methodology focused on reducing the delay between system feedback and user intent through specific UI/UX constraints. By prioritizing efficiency and stability, the system transforms the desktop into a streamlined tool for complex technical workflows.

### The "Red Focus" Visual Stack
The system utilizes a **Red Focus** color palette to manage visual priority and spatial awareness. By leveraging high-contrast gradients using `rgba(ff7a3cff)` and `rgba(ff3c6aff)` on active window borders, the environment creates an unmistakable focal point for the user. To maintain visual depth without sacrificing legibility, the system employs an 8-pass blur effect and 0.75 opacity for terminal windows, allowing background processes to remain peripherally visible while the primary task remains sharp. These background processes and secondary windows are designed to recede into the workspace, which minimizes cognitive load during extended sessions in demanding technical environments.

### Chronometric Synchronization
The interaction model is built on **Chronometric Sync**, treating the desktop as a precision instrument where every element is intentional and predictable:
* **Engineered Cursor Tracking:** Using **ImageMagick**, the system generates a custom cursor with a 2px black outline. This modification ensures 100% visibility against the vibrant red system borders, preventing "pointer loss" during rapid window switching or multi-monitor transitions.
* **Wayland-Native Stack:** The environment enforces a purely native Wayland stack for core tools like **Brave** and **Kitty**. By utilizing specialized easing curves like `easeOutQuint` and `almostLinear` for system-wide animations, the setup provides immediate visual confirmation of workspace transitions. This architecture minimizes input latency and provides a tactile, mechanical response to user commands.
* **Hardware-Agnostic Stability:** Configured with specialized status modules for Ethernet and USB management, the system is designed to meet the rigorous connectivity requirements of hardware-debugging and laboratory environments. This ensures that the workstation remains reliable regardless of the physical peripheral setup.

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
- Change the path to your username wherever getting errors! Please check. 

