#
# Spaceship prompt options
# https://denysdovhan.com/spaceship-prompt/docs/Options.html
#

# Order (left)
export SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
#  user          # Username section
  dir           # Current directory section
#  host          # Hostname section
  git           # Git section (git_branch + git_status)
#  hg            # Mercurial section (hg_branch  + hg_status)
#  package       # Package version
#  node          # Node.js section
#  ruby          # Ruby section
#  elixir        # Elixir section
#  xcode         # Xcode section
#  swift         # Swift section
#  golang        # Go section
#  php           # PHP section
#  rust          # Rust section
#  haskell       # Haskell Stack section
#  julia         # Julia section
#  docker        # Docker section
#  aws           # Amazon Web Services section
#  venv          # virtualenv section
#  conda         # conda virtualenv section
#  pyenv         # Pyenv section
#  dotnet        # .NET section
#  ember         # Ember.js section
#  kubecontext   # Kubectl context section
#  terraform     # Terraform workspace section
  exec_time     # Execution time
#  line_sep      # Line break
#  battery       # Battery level and status
#  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
#  exit_code     # Exit code section
  char          # Prompt character
)

# Order (right)
export SPACESHIP_RPROMPT_ORDER=(
#  time          # Time stamps section
#  user          # Username section
#  dir           # Current directory section
#  host          # Hostname section
#  git           # Git section (git_branch + git_status)
#  hg            # Mercurial section (hg_branch  + hg_status)
#  package       # Package version
#  node          # Node.js section
#  ruby          # Ruby section
#  elixir        # Elixir section
#  xcode         # Xcode section
#  swift         # Swift section
#  golang        # Go section
#  php           # PHP section
#  rust          # Rust section
#  haskell       # Haskell Stack section
#  julia         # Julia section
#  docker        # Docker section
#  aws           # Amazon Web Services section
#  venv          # virtualenv section
#  conda         # conda virtualenv section
#  pyenv         # Pyenv section
#  dotnet        # .NET section
#  ember         # Ember.js section
#  kubecontext   # Kubectl context section
#  terraform     # Terraform workspace section
#  exec_time     # Execution time
#  line_sep      # Line break
#  battery       # Battery level and status
#  vi_mode       # Vi-mode indicator
#  jobs          # Background jobs indicator
#  exit_code     # Exit code section
#  char          # Prompt character
)

# Char
export SPACESHIP_CHAR_COLOR_SUCCESS=118
export SPACESHIP_CHAR_COLOR_FAILURE=197
export SPACESHIP_CHAR_COLOR_SECONDARY=226

# Time
export SPACESHIP_TIME_SHOW=true
export SPACESHIP_TIME_COLOR=255
export SPACESHIP_TIME_SUFFIX=

# Username
export SPACESHIP_USER_SHOW=false
export SPACESHIP_USER_COLOR=197
export SPACESHIP_USER_COLOR_ROOT=201

# Directory
export SPACESHIP_DIR_PREFIX=
#export SPACESHIP_DIR_SUFFIX=' ▶'
export SPACESHIP_DIR_SUFFIX=
export SPACESHIP_DIR_TRUNC=2
export SPACESHIP_DIR_TRUNC_REPO=false
export SPACESHIP_DIR_COLOR=227
export SPACESHIP_DIR_LOCK_COLOR=202

# Git
export SPACESHIP_GIT_PREFIX=' '
#export SPACESHIP_GIT_SUFFIX=
export SPACESHIP_GIT_BRANCH_COLOR=197
export SPACESHIP_GIT_STATUS_COLOR=197

# Docker
export SPACESHIP_DOCKER_PREFIX=' '
export SPACESHIP_DOCKER_COLOR=045

# Kubectl
export SPACESHIP_KUBECONTEXT_COLOR=057

# Execution time
export SPACESHIP_EXEC_TIME_COLOR=227
