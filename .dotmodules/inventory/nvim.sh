#!/bin/bash

set -ev

VERSION=${VERSION:-stable}

unamestr="$(uname)"
if [[ "$unamestr" == "Darwin" ]]; then
  OS=macos
elif [[ "$unamestr" == "Linux" ]]; then
  OS=linux64
fi

# Get nvim release
cd /tmp
curl -LO https://github.com/neovim/neovim/releases/download/$VERSION/nvim-$OS.tar.gz
xattr -c nvim-$OS.tar.gz
tar xzf nvim-$OS.tar.gz
mkdir -p ~/.local

# Remove
rm -f ~/.local/bin/nvim    || true
rm -rf ~/.local/lib/nvim   || true
rm -rf ~/.local/share/nvim || true

# Install nvim
rsync -a nvim-$OS/* ~/.local/

# Cleanup
rm -rf nvim-$OS

# Install plugins
sh -c 'curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -E -s -u ~/.config/nvim/init.vim +PlugInstall +qall!
