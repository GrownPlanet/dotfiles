#!/bin/bash

pkg_manager="$1"

# general packages
sudo $pkg_manager install unzip fish sway waybar swaylock rofi neovim tmux alacritty celluloid mako grim slurp wl-clipboard wlogout playerctl

# backgrounds/ wallpapers
mkdir ~/.local/share/backgrounds/
cp ./assets/imgs/* ~/.local/share/backgrounds/

# fonts
mkdir ~/.local/share/fonts/
wget -O JetBrainsMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
unzip ./JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
rm ./JetBrainsMono.zip

# configs
ln -s $PWD/config/* $HOME/.config/

# tmux tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# cursor
mkdir ~/.local/share/icons/
tar -xf ./assets/cursors/Bibata-Modern-Classic.tar.xz -C ~/.local/share/icons/
