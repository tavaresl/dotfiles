
eval "$(/opt/homebrew/bin/brew shellenv)"

# Created by `pipx` on 2024-01-03 14:03:18
export PATH="$PATH:/Users/lucasrocha/.local/bin"

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

# Added by Toolbox App
export PATH="$PATH:/Users/lucasrocha/Library/Application Support/JetBrains/Toolbox/scripts"

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi


export PATH="$PATH:$(go env GOPATH)/bin"

if [ -d "$HOME/flutter" ]; then
	export PATH="$PATH:$HOME/flutter/bin"
fi

if [ -d "$HOME/.dotnet" ]; then
	export PATH="$PATH:/Users/lucasrocha/.dotnet/tools"
fi

export PATH="$PATH":"$HOME/.pub-cache/bin"

export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"



# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
