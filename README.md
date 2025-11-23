# Dotfiles

My dotfiles for MacOS and Linux, managed by Chezmoi.

## Setup

Run the following command. On MacOS, installs brew, mise (runtime managment), sets MacOS default settings, and installs GUI apps via brew cask through the Brewfile in this repository. On Linux, installs mise and applies dotfiles (no applications installed):

`sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply dhruva-dk`

## After Setup

Make sure to enable 1Password SSH agent (and if you're not me, update dotfiles as needed for SSH configuration).
