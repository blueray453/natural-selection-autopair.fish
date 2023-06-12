function _ctrl_shift_end
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-of-buffer
    else
        commandline -f begin-selection
        commandline -f end-of-buffer
    end

end
