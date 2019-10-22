export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

DIRSTACKSIZE=5
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt AUTOCD	# cd by typing dirname
setopt CDABLEVARS	# follow variables which are dirnames
setopt INTERACTIVECOMMENTS # allow comments on cmd line

# setopt SH_WORD_SPLIT # split up var in "for x in *"
setopt MULTIOS # allow multiple redirection echo 'a'>b>c
setopt CORRECT CORRECT_ALL # try to correct command line spelling
setopt BANG_HIST # allow ! for accessing history
setopt NOHUP # don't HUP running jobs on logout
setopt NOBGNICE # don't renice background jobs
setopt EXTENDED_GLOB # enable extended globbing

setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions
setopt EXTENDED_HISTORY # add timestamps to history
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY # adds history incrementally
setopt HIST_IGNORE_ALL_DUPS # don't record dupes in history
setopt HIST_REDUCE_BLANKS

setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

unsetopt NOMATCH # allow [ or ] whereever you want

setopt COMPLETE_ALIASES # don't expand aliases _before_ completion has finished (like: git comm-[tab])

# TERM specific options
case $TERM in
screen)
  setopt ignore_eof
  ;;
xterm*|rxvt|ansi)
  ;;
esac
