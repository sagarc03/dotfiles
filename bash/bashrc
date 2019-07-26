export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

_tmuxinator() {
    COMPREPLY=()
    local word
    word="${COMP_WORDS[COMP_CWORD]}"

    if [ "$COMP_CWORD" -eq 1 ]; then
        local commands="$(compgen -W "$(tmuxinator commands)" -- "$word")"
        local projects="$(compgen -W "$(tmuxinator completions start)" -- "$word")"

        COMPREPLY=( $commands $projects )
    elif [ "$COMP_CWORD" -eq 2 ]; then
        local words
        words=("${COMP_WORDS[@]}")
        unset words[0]
        unset words[$COMP_CWORD]
        local completions
        completions=$(tmuxinator completions "${words[@]}")
        COMPREPLY=( $(compgen -W "$completions" -- "$word") )
    fi
}

export EDITOR='vim'
complete -F _tmuxinator tmuxinator mux
alias tx=tmuxinator

ta () {
	local todo name array msg cmd i
	echo ""
	echo "What would you like to do? Pick a command or number in ()"
	echo ""
	echo "(c) Create a new session"
	echo "(d) Create a new session in detached mode"
	echo "(k) Kill server"
	echo ""
	
	array=(`tmux list-sessions -F '#{session_name}' 2>/dev/null`)

	if [ ${#array[@]} -eq 0 ]; then
		echo "Sorry, no active sessions to pick from :("
		echo ""
	else
		echo "You can also choose from the the session already active"
		echo ""
		for i in "${!array[@]}"
		do
			echo "($i) ${array[$i]}"
		done
	fi
	echo ""
	while [ -z "$todo" ]
	do
		read -p "Enter an option: " todo
	done

	echo ""
	echo "You selected $todo"

	if [ $todo = "c" ] || [ $todo = "d" ]
	then
		msg="Creating a new session"
		echo ""
		while [ -z "$name" ]
		do
			read -p "Please enter a name of the session : " name
		done
		echo ""
		cmd="tmux new -s $name"
		if [ $todo = d ]
		then
			cmd="$cmd -d"
			msg="$msg, in detached mode"
		fi
		msg="$msg. Session name : $name"
		echo $msg
		eval $cmd
		return
	fi
	
	if [ $todo = "k" ]
	then
		cmd="tmux kill-server"
		echo "Killing server"
		eval $cmd
		return
	fi
	name=${array[$todo]}
	if [ -z $name ]
	then
		echo "Invalid Command, try again"
		return
	fi
	cmd="tmux a -t ${array[$todo]}"
	echo "Appending tmux session ${array[$todo]}"	
	eval $cmd
}

export MODE="DEV"
