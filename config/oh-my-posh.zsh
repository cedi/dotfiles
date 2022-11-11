if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
	# Do nothing for stupid Apple_Terminal
elif [[ "$TERM_PROGRAM" == "WarpTerminal" ]]; then
	eval "$(oh-my-posh init zsh --config $OMP_CUSTOM/themes/tron-cedi-warp.omp.json)"
else
	eval "$(oh-my-posh init zsh --config $OMP_CUSTOM/themes/tron-cedi.omp.json)"
fi
