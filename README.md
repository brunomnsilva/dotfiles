# Dotfiles Management

This repository manages your essential dotfiles using Git and `stow`.

## Prerequisites

You need Git and GNU Stow installed on your system. If you don't have them, install them first (package `stow`).

## Setup Instructions

### 1. Clone the Repository
If you haven't already cloned this repository:
```bash
git clone https://github.com/youruser/dotfiles.git
cd dotfiles
```

### 2. Target Directory
By default, stow will write into the directory right above the repository directory (this can be changed by using `--target`). For this reason, `dotfiles` directory should be in your home directory.

### 3. Use Stow to Manage Files
This assumes your structure is organized by service (e.g., `tmux`, `zsh`). The repository reflects this organization:

```console
.
├── git
│   └── .config
│       └── git
│           └── config
├── hypr
│   └── .config
│       └── hypr
│           ├── autostart.lua
│           ├── bindings.lua
│           ├── hypridle.conf
│           ├── hyprland.lua
│           ├── hyprsunset.conf
│           ├── input.lua
│           ├── looknfeel.lua
│           ├── scripts
│           │   └── close-window-confirm.sh
│           └── xdph.conf
├── mpv
│   └── .config
│       └── mpv
│           └── mpv.conf
└── README.md
```

```bash
# Example for managing ZSH configuration files
cd dotfiles
stow zsh  # This creates symlinks in the target directory pointing to this folder's contents
```

To unlink a service (remove the symlinks):
```bash
stow -D zsh
```

### 4. Commit Changes with Git
Always commit your changes after making updates to your dotfiles structure or content:
```bash
git add .
git commit -m "Updated [service name] configuration"
git push -u origin master # Or your preferred branch
```
