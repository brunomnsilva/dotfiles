# Dotfiles Management with Stow and Git

This repository manages your essential dotfiles using GNU Stow for symlink management and Git for version control, following best practices outlined by experts in the community.

## 🚀 Introduction

Managing configuration files (dotfiles) can be complex. While many tools exist, using symbolic links via **GNU Stow** provides a reliable and efficient way to keep your configurations organized within a central repository while making them available at their actual home directory locations (`~/.config`, `~/.zshrc`, etc.).

## 📁 Repository Structure Overview

This repository is structured such that each primary dotfile service or tool (e.g., `nvim`, `tmux`, `zsh`) resides in its own dedicated subdirectory—these are the "packages."

Example structure:
```bash
dotfiles/
├── alacritty/       # Package for Alacritty config
├── nvim/            # Package for Neovim configuration
├── tmux/            # Package for Tmux configuration
├── zsh/             # Package for ZSH configuration files (.zshrc)
└── ...
```

## ✨ How GNU Stow Works

Stow's purpose is to act as a "symlink farm manager." When you `stow` a **package**, it creates symbolic links in your **target directory** (your home folder, e.g., `/home/username`) that point into the package subdirectory within this repository. This makes the configuration appear as if it was installed directly, but keeps it version-controlled.

### 1. Stowing a Package

To link all files from a package into your active system configuration:
```bash
stow <package_name>
# Example: stow zsh
```

**Note:** Stow assumes the target directory is the parent of the repository (your home folder). This assumption only holds true if your dotfiles repository resides in your home directory (`~`). Otherwise, you must explicitly use \`--target=<path>\` when running the command.

### 2. Unstowing/Deleting Symlinks

To remove the symlinks for a service (effectively uninstalling it):
```bash
stow -D <package_name>
# Example: stow -D tmux
```

## ⚙️ Best Practices and Automation

For maximum efficiency, consider automating your workflow:

### 1. The Makefile Approach
Use a `Makefile` to handle common tasks:
```makefile
all: stow --verbose --target=$$HOME --restow */
delete: stow --verbose --target=$$HOME --delete */
```
*   **Update All:** Running `make` will run `stow --restow`, ensuring all necessary symlinks are created or updated.
*   **Clean Up:** Running `make delete` removes all symlinks managed by this repository.

### 2. Ignoring Files
Stow allows you to customize which files it ignores (e.g., local build artifacts, temporary files) using a `.stow-local-ignore` file in the root of your dotfiles directory.

## 💾 Version Control Workflow (Git)

Always use Git when making changes:

1.  **Make Changes:** Edit your configuration files inside their respective package directories (`nvim/`, `tmux/`).
2.  **Stage & Commit:** Add the relevant packages and commit the updates.
    ```bash
    git add .
    git commit -m "Improved Neovim highlighting."
    git push origin main
    ```

*Note: Use a centralized location for this repository (e.g., `~/.dotfiles`).*
