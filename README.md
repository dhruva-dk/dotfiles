# Dotfiles

Personal dotfiles for macOS and Linux, managed with chezmoi.

## Supported platforms

- macOS (full bootstrap)
- Linux (dotfiles only; expects some prerequisites)

## Prerequisites

- macOS: none (bootstrap installs Homebrew and other tools)
- Linux: curl and git must already be installed

## Quick install

Run the chezmoi bootstrap and apply this repo:
`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply dhruva-dk`

Notes:

- On macOS this will install Homebrew, essential CLI packages including mise (runtime management) and starship (terminal prompt), apply macOS defaults, and install GUI apps listed in the included Brewfile.
- On Linux this installs mise and starship, then applies the dotfiles.

## After setup

- On Linux: install any required GUI apps (e.g., 1Password).
- Enable the 1Password SSH agent if you use it.
- If you are not Dhruva Kumar, update SSH and other machine-specific settings in the dotfiles as needed.
