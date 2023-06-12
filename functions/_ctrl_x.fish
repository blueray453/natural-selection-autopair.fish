function _ctrl_x
    set --local has_selection (commandline --selection-start)

    if test -n "$has_selection"
        set --local current_selection (commandline --current-selection | string collect)
        echo -ns -- $current_selection | xclip -selection clipboard
        commandline -f kill-selection
    else
        return
    end
end
