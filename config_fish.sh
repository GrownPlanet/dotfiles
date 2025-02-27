#!/bin/bash

echo "function fish_title
end

set fish_greeting" >> $HOME/.config/fish/config.fish

alias --save nv=nvim
