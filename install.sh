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
    git

echo "== Copiando archivos de configuracion =="
cp "$(dirname "$0")/.vimrc" ~/.vimrc
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

echo ""
echo "Listo. Entorno restaurado."
echo "Nota: recorda instalar tambien la fuente 'JetBrains Mono Nerd Font' a mano,"
echo "las fuentes no se pueden instalar automaticamente via dnf de forma estandar."
