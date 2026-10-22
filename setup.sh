#!/bin/bash

function installPackage() {
  local L_INSTALL_CMD=$1
  local L_PACKAGE=$2
  local L_LIST_PACKAGES=$3
  if ! echo "${L_LIST_PACKAGES} ${L_PACKAGE}" | grep -w -q "${L_PACKAGE}"; then
    echo "Instalando ${L_PACKAGE}..."
    (eval "${L_INSTALL_CMD}" "${L_PACKAGE}" && echo "🎉 ${L_PACKAGE} foi instalado com sucesso") || echo "❌ ${L_PACKAGE}"
  else
    echo "✅ ${L_PACKAGE} já está instalado!"
  fi
}

echo "O sistema vai atualizar agora."

# Primeiro, atualize o sistema
sudo dnf5 upgrade -y

echo "O sistema foi atualizado. Agora serão baixados os pacotes necessários."

INSTALL_CMD="sudo dnf5 install -y"
LIST_PACKAGES="dnf5 list"

VIRT=$(systemd-detect-virt)
if [ "$VIRT" = "none" ]; then

  echo "Habilitando o repositorio Terra e do Ghostty"

  sudo dnf config-manager --add-repo https://terra.fyralabs.com/terra.repo
  sudo dnf copr enable scottames/ghostty

  PACOTES=(
    "ghostty",
    "gamemode",
    "mangohud",
    "umbriel-nightly",
    "noctalia"
    )

  for PACKAGE in "${PACOTES[@]}"; do
    installPackage "${INSTALL_CMD}" "${PACKAGE}" "${LIST_PACKAGES}"
  done
else
  echo "Instalando terminal da VM."
  installPackage "${INSTALL_CMD}" kitty "${LIST_PACKAGES}"
fi

# Então, habilite os repositórios necessários e instale os pacotes
sudo dnf copr enable lihaohong/yazi
sudo dnf copr enable jdxcode/mise

PACKAGES=(
  "bat",
  "lsd",
  "mise",
  "zsh",
  "fzf",
  "git",
  "tldr",
  "fastfetch",
  "zoxide",
  "ripgrep",
  "yazi",
  "fortune",
  "cowsay",
  "lolcat",
  "luarocks"
  )

for PACKAGE in "${PACKAGES[@]}"; do
  installPackage "${INSTALL_CMD}"  "${PACKAGE}" "${LIST_PACKAGES}"
done

echo "Cache do tldr está sendo atualizado"

# Depois de instalar, rode o tldr
tldr -u
echo "Acabou de atualizar."

if ! command -v zsh >/dev/null 2>&1 || [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo >&2 "Instalando oh-my-zsh agora"; \
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  chsh -s $(which zsh)
else
  echo "✅ oh-my-zsh já tá instalado"
fi

# Instalando os plugins do OMZ
echo "📝 Instalando plugins do oh-my-zsh..."
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab" ]; then
  echo "⬇️ Clonando fzf-tab..."
  git clone https://github.com/Aloxaf/fzf-tab "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab"
else
  echo "✅ fzf-tab já está presente"
fi

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "⬇️ Clonando powerlevel10k..."
  git clone --depth 1 -- https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k"
else
  echo "✅ powerlevel10k já está presente"
fi

echo "Instalação dos plugins do OMZ finalizada."

PACKAGES_MISE=(
  "lazygit",
  "neovim",
  "opencode",
  "rust@nightly",
  "uv",
  "python@3.13",
  "node@22"
  )

  MISE_INSTALL_CMD="mise use -g"
  MISE_LIST_PACKAGES="mise ls"

# Instalando os pacotes do mise

echo "Instalando pacotes do mise"
for PACKAGE in "${PACKAGES_MISE[@]}"; do
  installPackage "${MISE_INSTALL_CMD}" "${PACKAGE}" "${MISE_LIST_PACKAGES}"
done
echo "Instalação dos pacotes do mise finalizada"

if [ "$VIRT" = "none" ]; then
  FLATPAK_INSTALL_CMD="flatpak install"
  FLATPAK_LIST_PACKAGES="flatpak info"

  PACKAGES_FLATPAK=(
    "app.zen_browser.zen",
    "com.discordapp.Discord",
    "com.github.tchx84.Flatseal",
    "com.obsproject.Studio",
    "com.rtosta.zapzap",
    "com.stremio.Stremio",
    "com.vysp3r.ProtoPlus",
    "io.github.ryubing.Ryujinx",
    "it.mijorus.gearlever",
    "me.iepure.devtoolbox",
    "org.gnome.World.PikaBackup",
    "org.videolan.vlc"
    )

  echo "Iniciando instalação dos pacotes Flatpak"
  for PACKAGE in "${PACKAGES_FLATPAK[@]}"; do
    installPackage "${FLATPAK_INSTALL_CMD}" "${PACKAGE}" "${FLATPAK_LIST_PACKAGES}"
  done
  echo "Instalação dos pacotes Flatpak finalizada"
fi

# Checando a instalação

echo ""
echo "🩺 Health check"
function checkBin() {
  local bin="$1"
  if command -v "$bin" >/dev/null 2>&1; then
    echo "✅ $bin -> $(command -v "$bin")"
  else
    echo "❌ $bin não encontrado"
}

echo "--- pacotes dnf ---"
for bin in bat lsd mise zsh fzf git tldr fastfetch zoxide ripgrep yazi fortune cowsay lolcat luarocks; do
  checkBin "$bin"
done

echo "--- TI ---"
for bin in python node uv; do
  checkBin "$bin"
done

echo ""
echo "🎉 Pronto"
echo ""
echo "Próximos passos:"
echo "   1. ./full_sync.sh  # Rode o script de sincronização"
echo "   2. exec zsh        # nova shell com tudo certo"
