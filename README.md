# My Dotfiles

My personal configuration files for macOS, managed with `stow` and `brew`.

---

## New Machine Setup

These are the steps to set up a new Mac to mirror this configuration.

### Before You Begin: Manual Steps

Before running the main installation script, some manual intervention is required.

1.  **Install Xcode Command Line Tools:** If it's a brand new Mac, open the Terminal app and run `xcode-select --install`. A GUI installer will pop up; complete the installation. This is required for Homebrew to work correctly.
2.  **Sign into the Mac App Store:** Open the App Store application and sign in with your Apple ID. This is necessary for `mas` to install applications like Xcode.
3.  **Be Ready with Your Password:** The `brew bundle install` command will install system-wide applications and will prompt for your administrator password multiple times.

### 1. Install Homebrew

If not already installed, run the following command:

```sh
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"
```

### 2. Clone This Repository

Clone the dotfiles into the correct directory.

```sh
git clone [https://github.com/dhruva-dk/dotfiles.git](https://github.com/dhruva-dk/dotfiles.git) ~/Developer/dotfiles
```

### 3. Install All Software

Navigate to the repository and use the `Brewfile` to install all command-line tools and applications.

```sh
cd ~/Developer/dotfiles
brew bundle install
```

### 4. Link the Dotfiles

Use `stow` to create the symlinks in your home directory. The command below uses full flag names for clarity.

- `--restow`: A safe operation that first removes old links and then creates new ones for the specified packages. This ensures everything is up-to-date.
- `--target=$HOME`: Explicitly sets the target directory for the symlinks to your home directory (`~`).

After the flags, list the names of the package folders you want to link.

```sh
cd ~/Developer/dotfiles
stow --restow --target=$HOME zsh git
```

### 5. Post-Installation Configuration

After the automated installation, a few tools need to be configured manually before they are ready to use.

#### Configure Java (`jenv`)

Your `Brewfile` installs multiple Java Development Kits (JDKs). You need to add them to `jenv` and set a global default.

```sh
# Add the installed Java versions to jenv
jenv add /usr/local/opt/openjdk@11
jenv add /usr/local/opt/openjdk@17
jenv add /usr/local/opt/openjdk

# Set your desired global default version (e.g., 17)
jenv global 17.0

# Verify the setup
jenv versions
```

#### Configure Ruby (`rbenv`)

To ensure `rbenv` manages your shell's Ruby version, you need to initialize it. The brew command will give you instructions, which typically involve adding a line to your shell configuration.

```bash
# This command will print the line you need to add
rbenv init
```

Since your `.zshrc` is managed by `stow`, you must add the required line to the source file located at `~/Developer/dotfiles/zsh/.zshrc`, not the one in your home directory.

#### Configure JetBrains IDEs

The `Brewfile` installs the JetBrains Toolbox, which manages all your JetBrains IDEs.

1. Open the JetBrains Toolbox application.
2. Sign in with your JetBrains account.
3. Use the Toolbox interface to install your desired IDEs (e.g., IntelliJ IDEA, PyCharm, WebStorm).

#### Configure Adobe Creative Cloud

The script installs the Adobe Creative Cloud manager. You must now:

1. Open the Creative Cloud application.
2. Sign in with your Adobe account.
3. Install Photoshop, Lightroom, etc., from within the app.

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
