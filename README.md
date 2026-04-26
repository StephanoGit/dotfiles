# dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) and [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle).

## Structure

```
dotfiles/
  brew/       → .Brewfile
  zsh/        → .zprofile, .zshrc
  ghostty/    → .config/ghostty/config
  starship/   → .config/starship.toml
  aerospace/  → .aerospace.toml
  nvim/       → .config/nvim/
```

## Fresh Machine Setup

```bash
git clone https://github.com/poporaduu/dotfiles ~/dotfiles
bash ~/dotfiles/bootstrap.sh
```

That's it. Restart your terminal when done.

## Day to Day

| Task | Command |
|---|---|
| Edit a config | `nvim ~/dotfiles/<package>/...` |
| Add brew package | add line to `.Brewfile` → `brew bundle install` |
| Remove brew package | remove line from `.Brewfile` → `brew bundle cleanup --force` |
| Add new app config | `mkdir` + create file + `stow <package>` |
| Sync to GitHub | `sync-dotfiles "message"` |

## Stack

- **Shell** — Zsh + Starship
- **Terminal** — Ghostty
- **Window Manager** — Aerospace
- **Package Manager** — Homebrew + Brewfile
- **Dotfile Manager** — GNU Stow
