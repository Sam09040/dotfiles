# First, upgrade the system
sudo dnf5 upgrade -y

sleep 2
# Then, get the repos and install all necessary packages
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable lihaohong/yazi
sudo dnf copr enable jdxcode/mise
sleep 2

sudo dnf5 install bat lsd mise zsh fzf git tldr ghostty fastfetch zoxide ripgrep gamemode mangohud nvim yazi fortune cowsay lolcat -y
sleep 2

# After install, run tldr
tldr -u

# Installing the plugins
sleep 2
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM"/plugins/zsh-autocomplete;\
git clone https://github.com/Aloxaf/fzf-tab "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/fzf-tab;\
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
sleep 2

# Installing nvim dependencies
sudo dnf5 install luarocks -y

# Install mise and the necessary packages
mise use -g lazygit neovim opencode rust@nightly uv python@3.13 node@22
