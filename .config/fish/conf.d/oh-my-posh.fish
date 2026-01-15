if string match -q Apple_Terminal "$TERM_PROGRAM"
    # Keep Apple Terminal clean
else if type -q oh-my-posh; and test -n "$OMP_CUSTOM"
    oh-my-posh init fish --config $OMP_CUSTOM/themes/tron-cedi.omp.json | source
end
