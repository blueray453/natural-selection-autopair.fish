function _ctrl_shift_home
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f beginning-of-buffer
    else
        commandline -f begin-selection
        commandline -f beginning-of-buffer
    end

end
