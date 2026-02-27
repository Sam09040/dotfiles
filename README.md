# Configuration guide

### If on fedora systems:

```bash
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable lihaohong/yazi
```

## Install all necessary packages

```bash
sudo dnf5/apt install / pacman -S rustup bat lsd zsh zsh-autosuggestions zsh-syntax-highlighting fzf git tldr ghostty fastfetch uv zoxide ripgrep tmux gamemode mangohud nvim yazi -y
```

### After installing everything run:
```bash
tldr -u
```

### After copying the files from the dotfiles:
```bash
enable-fzf-tab
toggle-fzf-tab
```

### If on ubuntu based systems use snap to install neovim and yazi

```bash
sudo snap install nvim yazi --classic
```

## Oh My Zsh config

**oh my zsh**: sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
**zsh-autosuggestions**: git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
**zsh-syntax-highlighting**: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
**zsh-autocomplete**: git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
**fzf-tab**: git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
**p10k**: git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

command with all of them:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions;\
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting;\
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete;\
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab;\
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

## Zen Browser

go to about:support
go to the profile directory (it's either on .zen if it's a native package or on .var/app if it's a flatpak)
go to the default dir
go to chrome
copy the Catppuccin folder there
add the UserChrome and UserContent from zen folder to the root of chrome
open zen

## nvim

```bash
sudo dnf5 install luarocks -y
```

or

```bash
sudo apt install python3-pip luarocks -y
```

## rustup -> blink.cmp

```bash
rustup toolchain install nightly
rustup default nightly
```

## tmux
### First you gotta install the tpm
```bash
git clone https://github.com/tmux-plugins/tpm
```

### Then use the following commands
Use the original prefix (C-b) + I to install plugins and (C-b) + r to reload config on first install.

## Others

- Manrope font
- Pika Backup

## Grub config

got to /etc/default/grub
add the line: GRUB_THEME=`path to the theme`
