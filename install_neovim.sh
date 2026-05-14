#!/bin/sh

TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

wget https://github.com/neovim/neovim/releases/download/v0.12.2/nvim-linux-x86_64.tar.gz

tar -xvf nvim-linux-x86_64.tar.gz

sudo mv nvim-linux-x86_64 /opt/nvim-linux-x86_64
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
