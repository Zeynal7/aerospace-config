# Dotfiles repo

A public repo of personal config files. All configs live here and are symlinked to their expected locations.

## Rules

- **No personal information.** Never commit usernames, hostnames, absolute paths containing usernames, API keys, or anything that identifies the machine owner. Use `~` or `$HOME` in scripts and docs, never hardcoded home directories.
- **Symlink pattern.** Configs live in this repo and are symlinked to their system locations via `install.sh`. Never edit the symlink targets directly — edit the files here.
- **No generated/installed files.** TPM plugins, caches, and other auto-generated content must not be committed. They are managed by their respective tools.

## Structure

```
.tmux.conf          → ~/.tmux.conf
tmux/scripts/       → ~/.tmux/scripts
aerospace.toml      → ~/.config/aerospace/aerospace.toml
install.sh          sets up all symlinks
```

## Adding a new config

1. Place the config file in this repo.
2. Add a `link_file` call in `install.sh`.
3. Update the table in `README.md`.
4. Run `./install.sh` to activate.
