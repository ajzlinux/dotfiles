#!/bin/bash
# ============================================
# install.sh - Restaura el entorno completo
# Uso: ejecutar desde dentro de ~/dotfiles
# ============================================

set -e  # si algo falla, el script se detiene en vez de seguir a ciegas

echo "== Instalando paquetes del sistema =="
sudo dnf install -y \
    vim-enhanced \
    kitty \
    ShellCheck \
    clang-tools-extra \
    ctags \
    curl \
    git \
    make \
    gcc

echo "== Copiando archivos de configuracion =="
cp "$(dirname "$0")/.vimrc" ~/.vimrc
cp "$(dirname "$0")/.bashrc" ~/.bashrc
mkdir -p ~/.config/kitty
cp "$(dirname "$0")/kitty.conf" ~/.config/kitty/kitty.conf

echo "== Creando carpetas de soporte de Vim (undo/backup) =="
mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/backup

echo "== Instalando vim-plug =="
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "== Instalando plugins de Vim =="
vim +PlugInstall +qall

echo "== Instalando ble.sh (autosugerencias en bash) =="
if [ ! -d ~/ble.sh-src ]; then
    git clone --recursive --depth 1 --shallow-submodules \
        https://github.com/akinomyoga/ble.sh.git ~/ble.sh-src
    cd ~/ble.sh-src
    make
    sudo make install PREFIX=/usr/local
    cd -
    rm -rf ~/ble.sh-src
fi

echo ""
echo "Listo. Entorno restaurado."
echo "Nota: recorda instalar tambien la fuente 'JetBrains Mono Nerd Font' a mano,"
echo "las fuentes no se pueden instalar automaticamente via dnf de forma estandar."
