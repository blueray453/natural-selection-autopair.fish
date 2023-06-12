function _ctrl_backspace
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f kill-selection
    else
        commandline -f backward-kill-word
    end
end