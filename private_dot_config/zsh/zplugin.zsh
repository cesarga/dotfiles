## zplugin
if [[ ! -f "${ZPLGM[BIN_DIR]}/zplugin.zsh" ]]; then
    exit 0
fi

source "${ZPLGM[BIN_DIR]}/zplugin.zsh"

zplugin load zdharma/history-search-multi-word

zplugin ice from"gh-r" as"program"
zplugin load junegunn/fzf-bin

# sharkdp/fd
zplugin ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zplugin light sharkdp/fd

# sharkdp/bat
zplugin ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zplugin light sharkdp/bat

# asciinema
zplugin ice as"command" wait lucid \
    atinit"export PYTHONPATH=$ZPFX/lib/python3.7/site-packages/" \
    atclone"PYTHONPATH=$ZPFX/lib/python3.7/site-packages/ \
    python3 setup.py --quiet install --prefix $ZPFX" \
    atpull'%atclone' test'0' \
    pick"$ZPFX/bin/asciinema"
zplugin load asciinema/asciinema.git

zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh

zplugin snippet OMZ::lib/git.zsh

zplugin ice atload"unalias grv"
zplugin snippet OMZ::plugins/git/git.plugin.zsh

zplugin snippet OMZ::plugins/git-flow/git-flow.plugin.zsh

zplugin snippet OMZ::plugins/encode64/encode64.plugin.zsh

zplugin snippet OMZ::lib/history.zsh
zplugin snippet OMZ::plugins/history-substring-search/history-substring-search.plugin.zsh

#zplugin snippet OMZ::lib/key-bindings.zsh

zplugin snippet https://github.com/changyuheng/zsh-interactive-cd/blob/master/zsh-interactive-cd.plugin.zsh

zplugin snippet "${XDG_CONFIG_HOME}/tmux/tmux.plugin.zsh"

zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
zplugin load trapd00r/LS_COLORS

zplugin load leophys/zsh-plugin-fzf-finder
zplugin load rupa/z

zplugin ice from"gh-r" as"program" mv"docker* -> docker-compose"
zplugin light docker/compose

zplugin ice as"completion"
zplugin snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zplugin ice wait lucid blockf atpull'zplugin creinstall -q .'
zplugin light zsh-users/zsh-completions

# zsh-autosuggestions
zplugin ice wait"1" lucid atload"!_zsh_autosuggest_start"
zplugin load zsh-users/zsh-autosuggestions

# fast-syntax-highlighting
zplugin ice wait"1" lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

setopt promptsubst
zplugin ice depth=1
zplugin light romkatv/powerlevel10k
