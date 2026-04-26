#!/bin/bash
set -e

echo "🚀 Starting bootstrap..."

# ── Homebrew ───────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ── Stow ──────────────────────────────────────────────────
if ! command -v stow &>/dev/null; then
  echo "Installing stow..."
  brew install stow
fi

# ── Symlinks ──────────────────────────────────────────────
echo "Stowing dotfiles..."
cd ~/dotfiles
stow */

# ── Packages ──────────────────────────────────────────────
echo "Installing brew packages..."
brew bundle install

echo "✅ Done — restart your terminal"
