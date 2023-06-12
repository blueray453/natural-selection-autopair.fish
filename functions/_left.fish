function _left
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-selection
        commandline -f backward-char
    else
        commandline -f backward-char
    end
end
