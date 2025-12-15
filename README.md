# Dotfiles

Personal dotfiles for macOS, managed with chezmoi. This will install Homebrew, essential CLI packages including mise (runtime management) and starship (terminal prompt), and install GUI apps listed in the included Brewfile.

For Linux, all dotfiles may be used escept `.Brewfile` and `.zshrc`, but bootstrapping is not supported for Linux (you must manually apply files and install binaries).

## Quick install

Run the chezmoi bootstrap (no prerequisites on macOS) and apply this repo:
`sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply dhruva-dk`

## After setup

- Enable the 1Password SSH agent if you use it.
- If you are not Dhruva Kumar, update SSH and other machine-specific settings in the dotfiles as needed.
