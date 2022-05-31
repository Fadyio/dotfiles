#!/usr/bin/env bash


# How to use:
#
# 1. Start a new bash session
# 2. source the completions script "source scd-completions.bash" or Copy the script in /etc/bash_completion.d/
# for automatic loading
# 3. scd <search-string>[TAB][TAB]
#
_scd_completions(){
	local cur=${COMP_WORDS[COMP_CWORD]}
	local IFS=$'\n'
	# handle space separated dir names
	dqc='"'
	while read -r file_path; do
		[[ -d $file_path ]] && search_results+=( "$dqc$file_path$dqc" )
	done < <( locate -er "/$cur$" )
	if [[ ${#search_results} == 0 ]]; then
		while read -r file_path; do
	    		[[ -d $file_path ]] && search_results+=( "$dqc$file_path$dqc" )
		# do loose search
		done < <( locate -ebr "$cur" )
	fi

	COMPREPLY=("${search_results[@]}")
	unset search_results
}

complete -F _scd_completions scd

 scd() {
     if [ -z "$1" ]; then
         echo "No directory path provided"
         exit 2
     else
         echo "$1"
         cd "$1" || exit
     fi
 }