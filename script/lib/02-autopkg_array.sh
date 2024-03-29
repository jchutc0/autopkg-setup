## autopkg_array
#### #### #### #### #### #### #### #### #### #### 
# $@ = array of repos
# debug function
# autopkg function
autopkg_array() {
	debug "Starting autopkg_array function"
	local autopkg_action="$1" && shift
	local arr=("$@")
	debug "Got array (${arr[*]})"
	for r in "${arr[@]}"; do
		debug "Loading repo ${r}"
		if ! autopkg "${autopkg_action}" "${r}" &> /dev/null; then
			echo "Unable to run action ${autopkg_action} on ${r}" 1>&2
			return 1
		fi
	done
	echo "Processed ${#arr[@]} items"
}
