if [[ "$(command -v javac)" ]]; then
  JAVA_HOME="$(dirname "$(dirname "$(realpath "$(command -v javac)")")")"
  export JAVA_HOME
fi
