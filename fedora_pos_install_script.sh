#!/usr/bin/env bash

# Updating packages
sudo dnf check-update && sudo dnf -y update

# Settings to Docker
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo


# Installing Snap
sudo dnf -y install snapd && snap install spotify -y

# Installing spotify
sudo snap install spotify

sudo dnf install -y vim \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    gnome-tweaks \
    zsh

# Docker
sudo systemctl start docker && sudo usermod -aG docker $USER

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo
sudo dnf check-update
sudo dnf install code

# Installing ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"\n
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
nvm install --lts && nvm use --lts

# Installing Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'export PATH=$PATH:~/.cargo/bin' >> ~/.zshrc

# Installing Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1 ~/flutter
echo 'export PATH=$PATH:~/flutter/bin' >> ~/.zshrc

echo "Installation complete! 🎉🎉🎉"
