# tmux

## Update gpakosz/.tmux
```bash
chezmoi-download-to-source() {
    curl -sfL "${1}" | tee "$(chezmoi source-path "${2}")" >/dev/null 2>&1
}

chezmoi-download-to-source https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf "${XDG_CONFIG_HOME}/tmux/tmux.conf"
chezmoi-download-to-source https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf.local "${XDG_CONFIG_HOME}/tmux/tmux.conf.local"

sed  -ri 's#~/.tmux.conf#"${XDG_CONFIG_HOME"}/tmux/tmux.conf"#g' "$(chezmoi source-path "${XDG_CONFIG_HOME}/tmux/tmux.conf")"
```
