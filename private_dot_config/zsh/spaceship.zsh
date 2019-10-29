#
# Spaceship prompt options
# https://denysdovhan.com/spaceship-prompt/docs/Options.html
#

# Order
export SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
#  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
#  ruby          # Ruby section
#  elixir        # Elixir section
#  xcode         # Xcode section
#  swift         # Swift section
#  golang        # Go section
  php           # PHP section
#  rust          # Rust section
#  haskell       # Haskell Stack section
#  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
#  conda         # conda virtualenv section
#  pyenv         # Pyenv section
#  dotnet        # .NET section
#  ember         # Ember.js section
  kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
#  battery       # Battery level and status
#  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# Time
export SPACESHIP_TIME_SHOW=true

# Directory
export SPACESHIP_DIR_TRUNC=2
export SPACESHIP_DIR_TRUNC_REPO=false

# Exit code
export SPACESHIP_EXIT_CODE_SHOW=true


#
# Disabled modules
#
export SPACESHIP_HG_SHOW=false
export SPACESHIP_HG_BRANCH_SHOW=false
export SPACESHIP_HG_STATUS_SHOW=false

export SPACESHIP_RUBY_SHOW=false

export SPACESHIP_ELM_SHOW=false

export SPACESHIP_ELIXIR_SHOW=false

export SPACESHIP_XCODE_SHOW_LOCAL=false
export SPACESHIP_XCODE_SHOW_GLOBAL=false

export SPACESHIP_SWIFT_SHOW_LOCAL=false
export SPACESHIP_SWIFT_SHOW_GLOBAL=false

export SPACESHIP_GOLANG_SHOW=false

export SPACESHIP_RUST_SHOW=false

export SPACESHIP_HASKELL_SHOW=false

export SPACESHIP_JULIA_SHOW=false

export SPACESHIP_CONDA_SHOW=false

export SPACESHIP_PYENV_SHOW=false

export SPACESHIP_DOTNET_SHOW=false

export SPACESHIP_EMBER_SHOW=false

export SPACESHIP_BATTERY_SHOW=false

export SPACESHIP_VI_MODE_SHOW=false
