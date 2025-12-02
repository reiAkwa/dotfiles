#! /usr/bin/env bash

# install the dotfile

USE_GUI=${USE_GUI:-0}
USE_INTEL=${USE_INTEL:-0}
USE_AMD=${USE_AMD:-0}

if [ $(whoami) = "root" ]; then
  echo "do not install as root!"
  exit 1
fi

# preparation
sudo pacman -Syyuu

sudo tee -a /etc/pacman.conf >/dev/null << 'EOF'
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
EOF

# TODO: enable multilib

sudo pacman -S yay

# base util

# environment
sudo pacman -S base-devel curl wget cmake xmake rustup llvm lua python node npm zig clang pip go pnpm yarn
sudo npm i -g typescript
npm install -g cnpm --registry=https://registry.npmmirror.com # fuck npm
rustup default stable

# editor & lsps
sudo pacman -S helix
sudo npm i -g bash-language-server
sudo pip install cmake-language-server
sudo npm i -g typescript-language-server
sudo npm i -g vscode-langservers-extracted # css, html, json, scss
sudo go install golang.org/x/tools/gopls@latest                               # LSP
sudo go install github.com/go-delve/delve/cmd/dlv@latest                      # Debugger
sudo go install golang.org/x/tools/cmd/goimports@latest                       # Formatter
sudo go install github.com/nametake/golangci-lint-langserver@latest           # Linter
sudo go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest # Linter cli
yay -S marksman-bin
yay -S termux-language-server
sudo pacman -S python-lsp-server
rustup component add rust-analyzer
sudo npm i -g svelte-language-server
sudo npm i -g typescript-svelte-plugin
cargo install taplo-cli --locked --features lsp
sudo npm i -g @vue/language-server
sudo npm i -g @vue/typescript-plugin
sudo npm i -g prettier

# useful tools
sudo pacman -S tmux
sudo pacman -S lazygit
sudo pacman -S lsd
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick
sudo pacman -S starship
echo 'eval "(starship init zsh)"' >> ~/.zshrc
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
# TODO: add useful zmodules. I am not used to sed
zimfw update && zimfw upgrade && zimfw install
sudo pacman -S htop # honestly, I hardly use it
sudo pacman -S ntfs-3g 

# toys!
sudo pacman -S lolcat cowsay cmatrix
yay -S fortune-mod-off fortune-mod-archlinx
sudo pacman -S fastfetch hyfetch

# gui utils
# WARNING: I have a long time no using linux desktop, so I take no guarantee of following command!
if [ $USE_GUI -eq 1 ]; then
  if [ $USE_INTEL -eq 1 ]; then
    sudo pacman -S mesa lib32-mesa vulkan-intel lib32-vulkan-intel xf86-video-intel
  elif [ $USE_AMD -eq 1 ]; then
    sudo pacman -S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon xf86-video-amdgpu
  fi
  # I will not install nvidia driver now
  
  # audio
  sudo pacman -S sof-firmware alsa-firmware alsa-ucm-conf

  # fonts
  sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra wqy-zenhei
  
  # install DE/WM
  sudo pacman -S wayland xorg-xwayland xorg
  sudo pacman -S gnome-shell nautilus
  sudo pacman -S hyprland # maybe next time, I will try niri?
  sudo pacman -S waybar
  sudo pacman -S mako
  sudo pacman -S wofi
  sudo pacman -S hyprpaper
  sudo pacman -S hyprpicker
  # sudo pacman -S hypridle
  # sudo pacman -S hyprlock
  sudo pacman -S xdg-desktop-portal-hyprland
  sudo pacman -S hyprland-qt-support
  sudo pacman -S qt5-wayland qt6-wayland
  sudo pacman -S cliphist

  # applications
  sudo pacman -S alacritty
  sudo pacman -S firefox
  sudo pacman -S telegram-desktop
  yay -S clash-verge-rev-bin #!!!
  yay -S linuxqq
  yay -S wechat
  sudo pacman -S obs-studio

  # editor
  yay -S visual-studio-code-bin

  # I wants to paint and make video on windows, but I would like to preserve somethins for them
  # sudo pacman -S krita gimp
  # sudo pacman -S kdenlive

  # I would like to play games on windows
  # yay -S hmcl-bin
  # sudo pacman -S steam
fi
