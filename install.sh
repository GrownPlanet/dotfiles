#!/bin/bash

pkg_manager="$1"
mode="$2"

if [ -z "$pkg_manager" ] || [ -z "$mode" ]; then
    echo "usage: ./install [package manager] [simple | complex]" >&2
    exit 1
fi

# general packages
sudo "$pkg_manager" install \
    fish unzip neovim tmux wl-clipboard kakoune \
    sway waybar swaylock fuzzel alacritty celluloid mako grim slurp wlogout playerctl imv

# backgrounds/ wallpapers
if [ ! -d "$HOME/.local/share/backgrounds" ]; then
    mkdir -p "$HOME/.local/share/backgrounds"
fi
cp ./assets/imgs/* ~/.local/share/backgrounds/

# fonts
if [ ! -d "$HOME/.local/share/fonts/JetBrainsMono" ]; then
    mkdir -p ~/.local/share/fonts/
    wget -O JetBrainsMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
    unzip ./JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
    rm ./JetBrainsMono.zip
fi

# configs
update_config() {
    f="$1"
    target="$HOME/.config/$(basename "$f")"
    echo "$target"
    if [ -e "$target" ] || [ -L "$target" ]; then
        rm "$target.old"
        mv "$target" "$target.old"
    fi
    ln -s "$f" "$target"
}

if [ "$mode" = "complex" ]; then
    for f in "$PWD/config/complex/"*; do
        update_config "$f"
    done
elif [ "$mode" = "simple" ]; then
    for f in "$PWD/config/simple/"*; do
        update_config "$f"
    done
else
    echo "usage: ./install [package manager] [simple | complex]" >&2
fi
    
for f in "$PWD/config/shared/"*; do
    update_config "$f"
done

# tmux tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# kakoune plugins
if [ ! -d "$HOME/.config/kak/plugins" ]; then
    mkdir -p $HOME/.config/kak/plugins
    git clone https://github.com/andreyorst/plug.kak.git $HOME/.config/kak/plugins/plug.kak
fi

# cursor
if [ ! -d "$HOME/.local/share/icons/Bibata-Modern-Classic" ]; then
    mkdir -p ~/.local/share/icons/Bibata-Modern-Classic
    tar -xf ./assets/cursors/Bibata-Modern-Classic.tar.xz -C ~/.local/share/icons/
fi
