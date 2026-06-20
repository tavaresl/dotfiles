eval "$(/opt/homebrew/bin/brew shellenv)"
[ -s "$HOME/.cargo/env" ] && \. "$HOME/.cargo/env"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Created by `pipx` on 2024-01-03 14:03:18
export PATH="$PATH:$HOME/.local/bin"

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"

# Added by Toolbox App
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH="$PATH:$(go env GOPATH)/bin"

if [ -d "$HOME/flutter" ]; then
	export PATH="$PATH:$HOME/flutter/bin"
	export PATH="$PATH:$HOME/.pub-cache/bin"
fi

if [ -d "$HOME/.dotnet" ]; then
	export PATH="$PATH:$HOME/.dotnet/tools"
fi

export NVM_DIR="$HOME/.nvm"
export JAVA_HOME=`/usr/libexec/java_home -v 17.0.10`
export MGFXC_WINE_PATH="$HOME/.winemonogame"

