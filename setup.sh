# First, upgrade the system
sudo dnf5 upgrade -y

# Then, get the repos and install all necessary packages
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable lihaohong/yazi
sudo dnf copr enable jdxcode/mise

sudo dnf5 install bat lsd mise zsh zsh-autosuggestions zsh-syntax-highlighting fzf git tldr ghostty fastfetch zoxide ripgrep tmux gamemode mangohud nvim yazi fortune cowsay lolcat -y

# After install, run tldr
tldr -u

# Installing the plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM"/plugins/zsh-autosuggestions;\
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM"/plugins/zsh-syntax-highlighting;\
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM"/plugins/zsh-autocomplete;\
git clone https://github.com/Aloxaf/fzf-tab "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/fzf-tab;\
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Installing nvim dependencies
sudo dnf5 install luarocks -y

# Install mise and the necessary packages
mise use -g lazygit neovim opencode rust@nightly uv python@3.13 node@22
