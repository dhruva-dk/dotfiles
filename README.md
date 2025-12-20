# Dotfiles

Personal dotfiles for macOS and Linux, managed with chezmoi. On macOS, this will also install Homebrew, essential CLI packages including mise (runtime management) and starship (terminal prompt), and install GUI apps listed in the included Brewfile. (Does not install binaries on Linux.)

## Install

On macOS, install xcode command line tools first:
`xcode-select --install`

On Linux, install git and curl (required) and install mise and starship (strongly recommended to avoid path issues with the chezmoi managed dotfiles). On MacOS, the bootstrap contains a script that installs all required binaries, so these manual installations are not required.

Run the chezmoi bootstrap and apply this repo:
`sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply dhruva-dk`

## After setup

Enable the 1Password SSH agent if you use it.

If you are not Dhruva Kumar, update SSH and other machine-specific settings in the dotfiles as needed.

Set remote of this repository to SSH instead of the default HTTPS that the bootstrap command uses: `chezmoi cd` then `git remote set-url origin git@github.com:dhruva-dk/dotfiles.git`
