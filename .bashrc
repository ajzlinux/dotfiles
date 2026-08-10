# .bashrc
source /usr/local/share/blesh/ble.sh
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

eval "$(starship init bash)"

# Alias para lsd
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'
alias lt2='lsd --tree --depth 2'
alias ll='lsd -l --header'          # con encabezados de columna
alias lsize='lsd -la --total-size'  # muestra tamaño total de directorios
alias cat='bat'

[[ ${BLE_VERSION-} ]] && ble-attach
