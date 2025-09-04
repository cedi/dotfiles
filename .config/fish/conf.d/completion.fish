if type -q hcloud
    hcloud completion fish | source
end

# TODO: fix the calendarapi binary, then reenable
if type -q calendarapi
    #    calendarapi completion fish | source
end
