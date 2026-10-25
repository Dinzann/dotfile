#!/usr/bin/env bash
# Restore stowed configs after cloning ~/dotfile (and optionally nix-darwin).
#
# Fresh machine:
#   git clone git@github.com:Dinzann/dotfile.git ~/dotfile
#   git clone git@github.com:Dinzann/Nix-darwin-config.git \
#     ~/dotfile/nix-darwin/.config/nix-darwin
#   ~/dotfile/bootstrap.sh
#   # then: install Determinate Nix, Homebrew, etc.
#   darwin-rebuild switch --flake ~/.config/nix-darwin#Dinzann
#
set -euo pipefail

DOTFILE="$(cd "$(dirname "$0")" && pwd)"
cd "$DOTFILE"

STOW_IGNORE=(--ignore='\.DS_Store')

NIX_DARWIN_DIR="$DOTFILE/nix-darwin/.config/nix-darwin"
if [[ ! -f "$NIX_DARWIN_DIR/flake.nix" ]]; then
  echo "nix-darwin package missing. Clone it first:"
  echo "  git clone git@github.com:Dinzann/Nix-darwin-config.git \\"
  echo "    $NIX_DARWIN_DIR"
  exit 1
fi

HOME_PACKAGES=(
  aerospace
  aria2
  borders
  btop
  cava
  fastfetch
  kitty
  lazygit
  nix-darwin
  omniwm
  pictures
  starship
  tmux
  yazi
  zed
  zsh
)

echo "==> Stow home packages → $HOME"
failed=0
for pkg in "${HOME_PACKAGES[@]}"; do
  if [[ -d "$DOTFILE/$pkg" ]]; then
    if ! stow -v --restow "${STOW_IGNORE[@]}" "$pkg"; then
      echo "!! failed: $pkg"
      failed=1
    fi
  else
    echo "skip missing: $pkg"
  fi
done

if [[ -d "$DOTFILE/nix-mirrors" ]]; then
  echo "==> Stow nix-mirrors → /etc (sudo)"
  if [[ ! -d /etc/nix ]]; then
    echo "!! /etc/nix missing — install Determinate Nix first, then re-run."
    failed=1
  else
    if [[ -e /etc/nix/nix.custom.conf && ! -L /etc/nix/nix.custom.conf ]]; then
      sudo mv /etc/nix/nix.custom.conf /etc/nix/nix.custom.conf.before-stow
    fi
    sudo stow -v --restow "${STOW_IGNORE[@]}" -t /etc nix-mirrors
  fi
fi

if [[ "$failed" -ne 0 ]]; then
  echo
  echo "Some steps failed; fix and re-run."
  exit 1
fi

echo
echo "Done. Next (if needed):"
echo "  darwin-rebuild switch --flake ~/.config/nix-darwin#Dinzann"
