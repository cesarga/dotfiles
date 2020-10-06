export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_ALT_C_COMMAND='rg --hidden --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq'

#export FZF_DEFAULT_OPTS='--reverse --inline-info --height 40%'

export FZF_COMPLETION_TRIGGER='ññ'
export FZF_COMPLETION_OPTS='+c -x'

export FZF_TMUX=1;
#export FZF_TMUX_OPTS='-h50%'
