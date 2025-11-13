# SHALL NOT BE RAN BY ITSELF

if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -rf yay
fi

sudo pacman -Syy

sudo pacman -S --noconfirm --needed zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo pacman -S --noconfirm --needed git base-devel tmux zip unzip ffmpeg vlc glow fastfetch zip unzip

yay -S --noconfirm --needed \
  github-cli \
  docker docker-compose \
  lazydocker \
  btop \
  python python-pip python-virtualenv \
  ncdu fzf ripgrep fd bat exa stow lazygit

if ! command -v nvm &>/dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

nvm install v22.20.0

curl -fsSL https://get.pnpm.io/install.sh | sh -

if [ ! -d "$HOME/.sdkman" ]; then
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

sdk install java 21.0.8-tem
sdk install gradle


sudo groupadd docker || true
sudo gpasswd -a "$USER" docker
newgrp docker


gh auth login

stow tmux
stow zsh
