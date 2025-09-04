if string match -q Apple_Terminal "$TERM_PROGRAM"
    # Do nothing for stupid Apple_Terminal because we want to keep it clean
    echo "Running inside Apple Terminal"
else
    oh-my-posh init fish --config $OMP_CUSTOM/themes/tron-cedi.omp.json | source
end
