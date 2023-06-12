function _ctrl_shift_right
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f forward-word
    else
        commandline -f begin-selection
        commandline -f forward-word
    end

end
