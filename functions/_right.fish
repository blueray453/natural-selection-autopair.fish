function _right
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f end-selection
        commandline -f forward-char
    else
        commandline -f forward-char
    end
end
