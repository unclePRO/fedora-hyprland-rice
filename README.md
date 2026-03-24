# Fedora + Hyprland rice
> A high-performance, focus-oriented Hyprland environment for Fedora 43.

## Design Philosophy: Chronosync
The Chronosync environment is a specialized desktop workspace built for high-stakes development cycles, specifically optimized for the Fedora 43 ecosystem. As a developer in a technical academic environment, the focus is on **"Visual Synchronization"**—the concept that the desktop should feel like an immediate extension of the user's thought process.

The **Red Focus** color palette utilizes high-contrast gradients (`rgba(ff7a3cff)` and `rgba(ff3c6aff)`) to emphasize the active task while peripheral windows recede into the background. A core technical feature is the **"Main Character" dispatcher**. By implementing a custom toggle that forces a 60% viewport width in a floating state, Chronosync ensures that web-based AI tools maintain their desktop layout, effectively solving the "scroll-jump" bug common in dynamic tiling layouts. This creates a dual-workflow: deep focus on the left (the Main Character) and secondary terminals or documentation on the right.

The system leverages a purely native Wayland stack to minimize input latency. The status bar, powered by **Waybar v0.14.0**, is stripped of clutter and configured with hardware-agnostic network modules to ensure compatibility with competition requirements. The integration of a custom-built cursor theme, **ChronoSync-Red**, reinforces the theme and ensures the pointer remains trackable against vibrant window borders.

---

## Dependencies
Ensure the following packages are installed via `dnf` to maintain the integrity of the Red Focus workflow.

### Core Environment
| Component | Package Name | Purpose |
| :--- | :--- | :--- |
| **Compositor** | `hyprland` | Core window manager logic. |
| **Status Bar** | `waybar` | CSS-themed status bar. |
| **Wallpaper** | `hyprpaper` | Minimalist wallpaper daemon. |
| **Portal** | `xdg-desktop-portal-hyprland` | Required for screen recording and sharing. |
| **Notifications** | `mako` | Wayland-native notification daemon. |

### Primary Applications
* **Terminal**: `kitty` (Configured with 0.75 opacity and background blur).
* **Browser**: `brave-browser` (Optimized with Ozone/Wayland flags).
* **File Manager**: `thunar` (With `gvfs` for USB/Ethernet support).
* **Launcher**: `wofi` (Configured with custom `aviral` prompt).

### System & Media Utilities
* **Audio/Backlight**: `wireplumber`, `brightnessctl`, `playerctl`.
* **Graphics**: `ImageMagick`, `bibata-cursor-themes`.
* **Applets**: `nm-applet`, `blueman-applet`.
* **Capture**: `grim`, `slurp`, `wl-clipboard`, `wf-recorder`.

---

## External Repositories
For icons to render correctly in the status bar, you **must** enable the following COPR for Nerd Font support:

```bash
sudo dnf copr enable maveonair/jetbrains-mono-nerd-fonts
sudo dnf install jetbrains-mono-nerd-fonts