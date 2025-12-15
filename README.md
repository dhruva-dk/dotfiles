# Dotfiles

Personal dotfiles for macOS and Linux, managed with chezmoi. On macOS, this will also install Homebrew, essential CLI packages including mise (runtime management) and starship (terminal prompt), and install GUI apps listed in the included Brewfile. (Does not install binaries on Linux.)

## Quick install

On macOS, install xcode command line tools first:
`xcode-select --install`

Run the chezmoi bootstrap (need `git` and `curl` on Linux) and apply this repo:
`sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply dhruva-dk`

## After setup

- Enable the 1Password SSH agent if you use it.
- If you are not Dhruva Kumar, update SSH and other machine-specific settings in the dotfiles as needed.
