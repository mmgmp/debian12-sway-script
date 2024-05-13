#!/bin/bash

# Instalar y activar ly

# Instalar sway y complementos
sudo apt install -y sway swayidle swaybg swaylock waybar xwayland

# Sway autotiling
sudo apt install -y python3-i3ipc
wget https://raw.githubusercontent.com/nwg-piotr/autotiling/master/autotiling/main.py
mv main.py autotiling
chmod +x autotiling
sudo mv autotiling /usr/bin/autotiling

# Menu de arranque
sudo apt install -y tofi

# Navegador
sudo apt install -y firefox-esr

# Gestor de archivos
sudo apt install -y lf

# Multimedia
sudo apt install -y mpv brightnessctl swayimg

# Notificaciones
sudo apt install -y sway-notification-center libnotify-bin

# Instalar programas adicionales
sudo apt install -y unzip curl network-manager newsboat pass pass-otp pinentry-gnome3 neovim abook

# Instalar PipeWire
sudo apt install -y pipewire pulseaudio-utils pavucontrol
systemctl --user --now enable wireplumber.service

# Descargar nwg-look
#wget https://github.com/nwg-piotr/nwg-look/releases/download/v0.2.7/nwg-look-v0.2.7_x86_64.tar.gz
#tar -xf nwg-look-v0.2.7_x86_64.tar.gz
#sudo mv nwg-look /usr/bin/nwg-look

# Instalar flatpak y añadir flathub.com
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Descargar Font Awesome 5
mkdir -p ~/.local/share/fonts
wget https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip
unzip fontawesome-free-5.15.4-desktop.zip
cp fontawesome-free-5.15.4-desktop/otfs/*.otf ~/.local/share/fonts

# Descargar FiraMono Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.zip
unzip FiraMono.zip
cp Fira*.otf ~/.local/share/fonts

# Actualizar cache de fuentes
fc-cache -f -v

# Descargar fondo de escritorio
mkdir -p ~/.local/share/backgrounds
wget https://raw.githubusercontent.com/mmgmp/fondos-de-pantalla/main/pixel-paisaje.png
mv pixel-paisaje.png ~/.local/share/backgrounds/pixel-paisaje.png

# Descargar scripts de tofi
mkdir -p ~/.local/bin
git clone https://github.com/mmgmp/tofi-scripts
cp -r tofi-scripts/*.sh ~/.local/bin/

# Colocar mis dotfiles
git clone https://github.com/mmgmp/dotfiles
cp dotfiles/.bashrc ~/.bashrc
cp -r dotfiles/.config ~/
cp -r dotfiles/.local ~/

# Carpeatas XDG
xdg-user-dirs-update
mkdir -p ~/.local/state/bash
mkdir -p ~/.local/share/gnupg

# Limpiar restos
cd ~/
rm -r --interactive=never sam/