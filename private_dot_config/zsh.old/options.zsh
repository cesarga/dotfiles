# setopt SH_WORD_SPLIT # split up var in "for x in *"
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt AUTOCD	# cd by typing dirname
setopt CDABLEVARS	# follow variables which are dirnames
setopt MULTIOS # allow multiple redirection echo 'a'>b>c
setopt CORRECT CORRECT_ALL # try to correct command line spelling
setopt NOHUP # don't HUP running jobs on logout
setopt EXTENDED_GLOB # enable extended globbing
setopt INTERACTIVE_COMMENTS # allow comments on cmd line
setopt NO_BG_NICE # don't nice background tasks
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt PROMPT_SUBST
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt COMPLETE_ALIASES # don't expand aliases _before_ completion has finished (like: git comm-[tab])

unsetopt NOMATCH # allow [ or ] whereever you want

#
# History
#
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY # adds history incrementally
setopt SHARE_HISTORY # share history between sessions
setopt EXTENDED_HISTORY # add timestamps to history
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt BANG_HIST # allow ! for accessing history

#
# Term
#
case $TERM in
screen)
 setopt ignore_eof
 ;;
xterm*|rxvt|ansi)
 ;;
esac
