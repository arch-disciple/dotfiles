function sparse_prompt --on-event fish_postexec
        echo
end

function fish_prompt --description 'Write out the prompt'
        set -l last_status $status
        set -l normal (set_color normal)
        set -l status_color (set_color green)
        set -l cwd_color (set_color $fish_color_cwd)

        if contains -- --final-rendering $argv
                set -l suffix ''

                echo -s $cwd_color (prompt_pwd) ' ' (set_color blue) $suffix ' '
        else

                # Since we display the prompt on a new line allow the directory names to be longer.
                set -q fish_prompt_pwd_dir_length
                or set -lx fish_prompt_pwd_dir_length 0

                set -l suffix '╰─'

                # Color the prompt in red on error
                if test $last_status -ne 0
                        set status_color (set_color $fish_color_error)
                end

                echo -s '╭─ ' (prompt_login) ' ' $cwd_color (prompt_pwd)
                echo -n -s $status_color $suffix ' ' $normal
        end
end
