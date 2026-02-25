#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# ── helpers ──────────────────────────────────────────────────
link_file() {
  local src="$1" dst="$2"

  if [ -L "$dst" ]; then
    echo "  removing old symlink $dst"
    rm "$dst"
  elif [ -e "$dst" ]; then
    echo "  backing up $dst → ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "  linked $dst → $src"
}

echo "==> Linking tmux config"
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

echo "==> Linking tmux scripts"
link_file "$DOTFILES_DIR/tmux/scripts" "$HOME/.tmux/scripts"

echo "==> Linking AeroSpace config"
link_file "$DOTFILES_DIR/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

echo "==> Installing TPM (if not present)"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  echo "  TPM installed"
else
  echo "  TPM already installed"
fi

echo "==> Installing TPM plugins"
"$HOME/.tmux/plugins/tpm/bin/install_plugins"

echo ""
echo "Done! Restart tmux or run:  tmux source-file ~/.tmux.conf"
