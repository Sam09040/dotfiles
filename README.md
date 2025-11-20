# Configuration guide
```bash
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable lihaohong/yazi

sudo dnf5 install bat lsd zsh zsh-autosuggestions zsh-syntax-highlighting fzf git tldr ghostty fastfetch uv zoxide ripgrep yazi tmux gamemode mangohud -y

tldr -u

enable-fzf-tab
toggle-fzf-tab
```

### If on ubuntu based systems use snap to install neovim and yazi
```bash
sudo snap install nvim yazi --classic
``` 

## Oh My Zsh config
quick guide for basics: https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df
fzf-tab: git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
p10k: git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

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
sudo dnf install rustup -y
rustup toolchain install nightly
rustup default nightly
```

## tmux
use the prefix + I to install plugins and prefix + r to reload config

## Others
- Manrope font
- Pika Backup
