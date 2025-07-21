#!/bin/bash

set -e

# Define where dotfiles live and where to install
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%s)"

echo "Installing dotfiles from $DOTFILES_DIR"
echo "Backing up existing dotfiles to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Map of source folders to destination dotfiles
declare -A FILES_TO_INSTALL=(
  ["bash/.bashrc"]="$HOME/.bashrc"
  ["bash/.bash_aliases"]="$HOME/.bash_aliases"
  ["bash/.bash_git"]="$HOME/.bash_git"
  ["bash/.bash_profile"]="$HOME/.bash_profile"
  ["bash/.bash_scripts"]="$HOME/.bash_scripts"
  ["bash/.profile"]="$HOME/.profile"
  ["vim/.vimrc"]="$HOME/.vimrc"
  ["tmux/.tmux.conf"]="$HOME/.tmux.conf"
  ["ranger/rc.conf"]="$HOME/.config/ranger/rc.conf"
  ["ranger/rifle.conf"]="$HOME/.config/ranger/rifle.conf"
  ["ranger/scope.sh"]="$HOME/.config/ranger/scope.sh"
  ["ranger/commands.py"]="$HOME/.config/ranger/commands.py"
  ["ranger/commands_full.py"]="$HOME/.config/ranger/commands_full.py"
)

for src in "${!FILES_TO_INSTALL[@]}"; do
  dst="${FILES_TO_INSTALL[$src]}"
  src_path="$DOTFILES_DIR/$src"

  echo "Processing $dst"

  # Backup if exists
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    echo "Backing up $dst"
    mkdir -p "$(dirname "$BACKUP_DIR/$dst")"
    mv "$dst" "$BACKUP_DIR/$dst"
  fi

  # Ensure parent directory exists
  mkdir -p "$(dirname "$dst")"

  # Create symlink
  ln -s "$src_path" "$dst"
  echo "Linked $src_path -> $dst"
done

echo "Installation complete."

