#!/usr/bin/env bash
set -euo pipefail

# =========================
# Globals
# =========================
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP="$(date +%s)"
BACKUP_DIR="$DOTFILES_DIR/backup/$TIMESTAMP"

DRY_RUN=false
UNINSTALL=false
ONLY_MODULES=()

# =========================
# Helpers
# =========================
usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Options:
  -n, --dry-run              Show actions without executing them
  -u, --uninstall            Remove symlinks and restore backups
  -o, --only <modules>       Operate only on given modules (comma-separated)
                             Available modules: bash, vim, tmux, ranger
  -h, --help                 Show this help

Examples:
  $(basename "$0")
  $(basename "$0") --only bash,vim
  $(basename "$0") --uninstall
  $(basename "$0") --uninstall --only ranger
EOF
}

log()   { echo "[*] $*"; }
warn()  { echo "[!] $*" >&2; }

run() {
  if $DRY_RUN; then
    echo "[DRY-RUN] $*"
  else
    "$@"
  fi
}

# =========================
# Argument parsing
# =========================
while [[ $# -gt 0 ]]; do
  case "$1" in
    -n|--dry-run)
      DRY_RUN=true
      shift
      ;;
    -u|--uninstall)
      UNINSTALL=true
      shift
      ;;
    -o|--only)
      IFS=',' read -ra ONLY_MODULES <<< "$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      warn "Unknown option: $1"
      usage
      exit 1
      ;;
  esac
done

# =========================
# Module filtering
# =========================
module_enabled() {
  local module="$1"

  [[ ${#ONLY_MODULES[@]} -eq 0 ]] && return 0

  for m in "${ONLY_MODULES[@]}"; do
    [[ "$m" == "$module" ]] && return 0
  done

  return 1
}

# =========================
# Dotfiles map (with module)
# =========================
declare -A FILES_TO_INSTALL=(
  ["bash/.bashrc"]="bash:$HOME/.bashrc"
  ["bash/.bash_aliases"]="bash:$HOME/.bash_aliases"
  ["bash/.bash_git"]="bash:$HOME/.bash_git"
  ["bash/.bash_profile"]="bash:$HOME/.bash_profile"
  ["bash/.bash_scripts"]="bash:$HOME/.bash_scripts"
  ["bash/.profile"]="bash:$HOME/.profile"

  ["vim/.vimrc"]="vim:$HOME/.vimrc"

  ["tmux/.tmux.conf"]="tmux:$HOME/.tmux.conf"

  ["ranger/rc.conf"]="ranger:$HOME/.config/ranger/rc.conf"
  ["ranger/rifle.conf"]="ranger:$HOME/.config/ranger/rifle.conf"
  ["ranger/scope.sh"]="ranger:$HOME/.config/ranger/scope.sh"
  ["ranger/commands.py"]="ranger:$HOME/.config/ranger/commands.py"
  ["ranger/commands_full.py"]="ranger:$HOME/.config/ranger/commands_full.py"
)

# =========================
# Actions
# =========================
backup_if_needed() {
  local dst="$1"
  local backup_path="$BACKUP_DIR/$dst"

  if [[ -e "$dst" || -L "$dst" ]]; then
    log "Backing up $dst"
    run mkdir -p "$(dirname "$backup_path")"
    run mv "$dst" "$backup_path"
  fi
}

install_link() {
  local src="$1"
  local dst="$2"

  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    log "Already linked: $dst"
    return
  fi

  run mkdir -p "$(dirname "$dst")"
  run ln -s "$src" "$dst"
  log "Linked $src -> $dst"
}

uninstall_link() {
  local src="$1"
  local dst="$2"

  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    log "Removing symlink $dst"
    run rm "$dst"
  else
    warn "Skipping $dst (not a managed symlink)"
  fi
}

init_submodules() {
  local module="$1"

  case "$module" in
    vim|tmux)
      log "Initializing git submodules for $module"
      run git -C "$DOTFILES_DIR" submodule update --init --recursive "$module"
      ;;
  esac
}

# =========================
# Main
# =========================
if ! $UNINSTALL; then
  log "Installing dotfiles from $DOTFILES_DIR"
  log "Backup directory: $BACKUP_DIR"
  $DRY_RUN || mkdir -p "$BACKUP_DIR"
else
  log "Uninstalling dotfiles"
fi

for src in "${!FILES_TO_INSTALL[@]}"; do
  entry="${FILES_TO_INSTALL[$src]}"
  module="${entry%%:*}"
  dst="${entry#*:}"
  src_path="$DOTFILES_DIR/$src"

  init_submodules "$module"
  module_enabled "$module" || continue

  if [[ ! -e "$src_path" ]]; then
    warn "Source missing: $src_path (skipping)"
    continue
  fi

  if $UNINSTALL; then
    uninstall_link "$src_path" "$dst"
  else
    backup_if_needed "$dst"
    install_link "$src_path" "$dst"
  fi
done

log "Done."

