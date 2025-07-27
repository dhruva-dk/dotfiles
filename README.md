# My Dotfiles

My personal configuration files for macOS, managed with `stow` and `brew`.

---

## New Machine Setup

These are the steps to set up a new Mac to mirror this configuration.

### 1. Install Homebrew

If not already installed, run the following command:

```sh
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"
```

### 2. Install Oh My Zsh

This framework is required for the custom shell configuration.

```sh
sh -c "$(curl -fsSL [https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh))"
```

### 3. Clone This Repository

Clone the dotfiles into the correct directory.

```sh
git clone [https://github.com/dhruva-dk/dotfiles.git](https://github.com/dhruva-dk/dotfiles.git) ~/Developer/dotfiles
```

### 4. Install All Software

Navigate to the repository and use the `Brewfile` to install all command-line tools and applications.

```sh
cd ~/Developer/dotfiles
brew bundle install
```

### 5. Link the Dotfiles

Use `stow` to create the symlinks in your home directory. The command below uses full flag names for clarity.

- `--restow`: A safe operation that first removes old links and then creates new ones for the specified packages. This ensures everything is up-to-date.
- `--target=$HOME`: Explicitly sets the target directory for the symlinks to your home directory (`~`).

After the flags, list the names of the package folders you want to link.

```sh
cd ~/Developer/dotfiles
stow --restow --target=$HOME zsh git
```

---

## Useful `stow` Commands

### Shortened Command

For day-to-day use, you can use the short flags. This command does the exact same thing as the one above.

```sh
stow -R -t ~ zsh git
```

### Adding a New Package

To add a new package in the future (e.g., `vim`):

1. Create a `vim` folder in this repository.
2. Add your `.vimrc` file to the `vim` folder.
3. Add `vim` to the end of the `stow` command: `stow -R -t ~ zsh git vim`

### Other Useful Flags

- **Deleting Links (`-D` or `--delete`):** To remove the symlinks for a package, use the `-D` flag. This is useful if you want to stop managing a tool's configuration.

  ```sh
  stow -D -t ~ git
  ```

- **Dry Run (`-n` or `--no`):** To see what `stow` _would_ do without actually making any changes, use the `-n` flag. This is great for checking for potential conflicts before running the real command.
  ```sh
  stow -n -R -t ~ zsh git
  ```

### Alternative Approach: Running from the Target Directory

You can also run `stow` from the target directory (`~`) and point it back to your dotfiles repository. This achieves the same result.

- `--dir=Developer/dotfiles`: Sets the **d**irectory where the `stow` packages can be found.

```sh
# Navigate to the target directory first
cd ~

# Run stow, pointing it to the source directory
stow --restow --dir=Developer/dotfiles zsh git
```

The shortened version of this command would be:

```sh
stow -R -d Developer/dotfiles zsh git
```

---

After setting up, open a new terminal window to ensure all changes are loaded.
