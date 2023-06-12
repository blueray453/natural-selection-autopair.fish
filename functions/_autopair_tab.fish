function _autopair_tab

    commandline -f end-selection

    if commandline --paging-mode
        down-or-search
        return
    end

    # [^\s] means not white space. The regex match "$variable"
    # What the following condition does is, if a line is like
    # `"$variable"` then remove the last ". So it becomes `"$variable`
    # if a line is like `"$variable" nice`, then put cursor at the end
    # of line.
    if string match --quiet --regex -- '\$[^\s]*"$' (commandline --current-token)
        commandline -f end-of-line
        commandline -f backward-delete-char
    end
    commandline --function complete
end

