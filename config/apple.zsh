# make cursor movement convenient in macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
	bindkey "^[^[[D" backward-word
	bindkey "^[^[[C" forward-word
	bindkey "^[[H" beginning-of-line
	bindkey "^[[F" end-of-line
fi