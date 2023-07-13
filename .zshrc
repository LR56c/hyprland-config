#!/usr/bin/env zsh
# Uncomment for debuf with `zprof`
# zmodload zsh/zprof




# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FCNTL_LOCK
setopt +o nomatch
# setopt autopushd




ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)




# Start Zim
source "$ZIM_HOME/init.zsh"




# Async mode for autocompletion
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300




source "$DOTFILES_PATH/shell/init.sh"




fpath=("$DOTFILES_PATH/shell/zsh/themes" "$DOTFILES_PATH/shell/zsh/completions" "$DOTLY_PATH/shell/zsh/themes" "$DOTLY_PATH/shell/zsh/completions" $fpath)



autoload -Uz promptinit && promptinit
prompt ${DOTLY_THEME:-codely}




source "$DOTLY_PATH/shell/zsh/bindings/dot.zsh"
source "$DOTLY_PATH/shell/zsh/bindings/reverse_search.zsh"
source "$DOTFILES_PATH/shell/zsh/key-bindings.zsh"


alias .="pcmanfm . &"
alias w.="webstorm . &"
alias c.="clion . &"
alias s.="studio . &"
alias p.="pycharm . &"
alias i.="idea . &"
alias g.="gateway . &"
alias discord="Discord"




export snap="/var/lib/snapd/snap"
export PATH="$PATH:$snap/bin"




export FZF_DEFAULT_OPTS='
--color=pointer:#ebdbb2,bg+:#3c3836,fg:#ebdbb2,fg+:#fbf1c7,hl:#8ec07c,info:#928374,header:#fb4934
--reverse
'


BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_PLUG='j:z;f:fzcd;p:preview-tui-ext'
export NNN_FIFO=/tmp/nnn.fifo
export JAVA_HOME="/home/lr56c/.sdkman/candidates/java/current"
export jetbrains="/home/lr56c/.local/share/JetBrains/Toolbox/scripts"
export cargo="/home/lr56c/.cargo"
export v="/home/lr56c/v"
export flutter="/home/lr56c/snap/flutter/common/flutter"
export CHROME_EXECUTABLE="/opt/google/chrome/chrome"
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export discord="/home/lr56c/Discord"
export PATH="$PATH:$JAVA_HOME/bin:$cargo/bin:$jetbrains:$v:$flutter/bin:$snap/bin:$discord"
export PATH="/home/lr56c/.local/bin:$PATH"




RPROMPT="<%T>"




loadnvm(){
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
}




if type complete &>/dev/null; then
_npm_completion () {
  local words cword
  if type _get_comp_words_by_ref &>/dev/null; then
	_get_comp_words_by_ref -n = -n @ -n : -w words -i cword
  else
	cword="$COMP_CWORD"
	words=("${COMP_WORDS[@]}")
  fi








  local si="$IFS"
  if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                     	COMP_LINE="$COMP_LINE" \
                     	COMP_POINT="$COMP_POINT" \
                     	npm completion -- "${words[@]}" \
                     	2>/dev/null)); then
	local ret=$?
	IFS="$si"
	return $ret
  fi
  IFS="$si"
  if type __ltrim_colon_completions &>/dev/null; then
	__ltrim_colon_completions "${words[cword]}"
  fi
}
complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
_npm_completion() {
  local si=$IFS
  compadd -- $(COMP_CWORD=$((CURRENT-1)) \
           	COMP_LINE=$BUFFER \
           	COMP_POINT=0 \
           	npm completion -- "${words[@]}" \
           	2>/dev/null)
  IFS=$si
}
compdef _npm_completion npm
elif type compctl &>/dev/null; then
_npm_completion () {
  local cword line point words si
  read -Ac words
  read -cn cword
  let cword-=1
  read -l line
  read -ln point
  si="$IFS"
  if ! IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                 	COMP_LINE="$line" \
                 	COMP_POINT="$point" \
                 	npm completion -- "${words[@]}" \
                 	2>/dev/null)); then








	local ret=$?
	IFS="$si"
	return $ret
  fi
  IFS="$si"
}
compctl -K _npm_completion npm
fi




#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
