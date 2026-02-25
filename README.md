# Dotfiles

Personal configuration files managed via symlinks.

## What's included

| Config | Source (this repo) | Symlink target |
|---|---|---|
| tmux config | `.tmux.conf` | `~/.tmux.conf` |
| tmux scripts | `tmux/scripts/` | `~/.tmux/scripts` |
| AeroSpace WM | `aerospace.toml` | `~/.config/aerospace/aerospace.toml` |

## Setup

```bash
git clone <this-repo> ~/dotfiles   # or wherever you prefer
cd ~/dotfiles
./install.sh
```

The install script will:
1. Symlink `.tmux.conf` to `~/.tmux.conf` (backs up existing file if present)
2. Symlink `tmux/scripts/` to `~/.tmux/scripts` (backs up existing directory if present)
3. Install [TPM](https://github.com/tmux-plugins/tpm) if not already present

After installing, open tmux and press `prefix + I` to install plugins via TPM.

## tmux

**Prefix:** `Option-a` (`M-a`)

### Key bindings

| Keys | Action |
|---|---|
| `prefix + n` | New window (same directory) |
| `prefix + a` | List windows |
| `prefix + t` | Rename window |
| `prefix + -` | Kill window |
| `prefix + s` | List sessions |
| `prefix + S` | New session |
| `prefix + T` | Rename session |
| `prefix + _` | Kill session |
| `prefix + arrows` | Navigate panes |
| `prefix + Shift+arrows` | Split pane in that direction |
| `prefix + e` | Edit config in nano and reload |
| `prefix + r` | Reload config |

### Status bar scripts

Custom scripts in `tmux/scripts/` display system stats in the status bar:

- **cpu.sh** — CPU usage percentage
- **ram.sh** — RAM usage percentage

### Plugins (managed by TPM)

- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) — clipboard integration
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) — persist sessions across restarts

> Plugins are not checked into this repo. TPM installs them at `~/.tmux/plugins/`.
