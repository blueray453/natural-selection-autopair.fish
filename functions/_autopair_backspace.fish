function _autopair_backspace
    set -l index (commandline --cursor)
    set -l buffer (commandline)
    set -l has_selection (commandline --selection-start)

    if test -n "$has_selection"
        commandline -f kill-selection
    else
        if test $index -ge 1 && contains -- (string sub --start=$index --length=2 -- "$buffer") $autopair_pairs
            commandline -f delete-char
        end

        commandline -f backward-delete-char
    end
end




