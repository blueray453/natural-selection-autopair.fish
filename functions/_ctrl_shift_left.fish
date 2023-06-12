function _ctrl_shift_left
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f backward-word
    else
        commandline -f begin-selection
        commandline -f backward-word
    end

end
