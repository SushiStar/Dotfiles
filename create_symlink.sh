#!/bin/bash

ln -fs $(pwd)/lua $HOME/.config/nvim/lua
ln -fs $(pwd)/vimrc $HOME/.config/nvim/init.vim

ln -sf $(pwd)/vifmrc $HOME/.config/vifm/vifmrc

OS=$(uname)
if [ "$OS" = "Linux" ]; then
    ln -sf $(pwd)/uzshrc $HOME/.zshrc
elif [ "$OS" = "Darwin" ]; then
    ln -sf $(pwd)/zshrc $HOME/.zshrc
else
    echo "This system is neither Linux nor macOS."
fi

