#!/bin/bash

DOTFILES="
.bash_profile
.bashrc
.bash_aliases
.vimrc
.tmux.conf
.tmux.conf.local
.gitconfig
"

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

EXEC_TIME=$(date +%Y_%m_%d__%H_%M)
BACKUP_DIR="${HOME}/dotfiles_backup/${EXEC_TIME}"


backup () {
    echo "Creating backup directory..."
    mkdir -p "$BACKUP_DIR"
    echo "Backup directory has been created in: ${BACKUP_DIR}"
 
    echo "Start dotfiles backup..."
    for file in $DOTFILES; do
        home_file="${HOME}/${file}" 
        if [ -f "$home_file" ]; then
            backup_file="${BACKUP_DIR}/${file}"
            echo " -> Copying ${home_file} to ${backup_file}" 
            cp "$home_file" "$backup_file"
        fi
   done
   echo "Dotfiles backup has been finished."
}

link() {
    echo "Linking dotfiles to home directory..."
    for file in $DOTFILES; do
        repo_file="${SCRIPT_DIR}/${file}"
        if [ -f "$repo_file" ]; then
            home_file="${HOME}/${file}"
            echo " -> Linking ${repo_file} to ${home_file}"
            ln -s -f "$repo_file" "$home_file"
        fi
    done
    echo "Linking has been finished."
}

configure_tmux () {
    conf_repo="https://github.com/gpakosz/.tmux.git" 
    conf_dir="${HOME}/.tmux"
    echo "Current tmux setup depends on: ${conf_repo}"
    
    if [ -d "$conf_dir" ]; then
        echo "Oh my tmux is already installed."
        return
    fi
    
    echo "Installing oh my tmux..."
    git clone "$conf_repo" "$conf_dir"
    ln -s -f "${conf_dir}/.tmux.conf" "${HOME}/.tmux.conf" 
}

install_vim_conf() {
    conf_repo="https://github.com/VundleVim/Vundle.vim.git"
    conf_dir="${HOME}/.vim/bundle/Vundle.vim"
    echo "Current vim setup depends on: ${conf_repo}"

    if [ -d "$conf_dir" ]; then
        echo "Vundle is already installed."
        return
    fi

    echo "Installing vundle..."
    git clone "$conf_repo" "$conf_dir" 
}

install_vim_plugins() {
    echo "Installing vim plugins..."
    vim +PluginInstall +qall
}

configure_vim() {
    install_vim_conf
    install_vim_plugins
}


backup
link
configure_tmux
configure_vim

echo "Installing has been complete!"
