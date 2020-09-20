if [[ "$(command -v javac)" ]]; then
  export JAVA_HOME="$(dirname "$(dirname "$(realpath "$(command -v javac)")")")"
fi
