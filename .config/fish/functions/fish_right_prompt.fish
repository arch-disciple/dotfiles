function fish_right_prompt
        set -l last_status_right_prompt $status
        set -l vcs_color (set_color blue)
        set -l status_color_right_prompt (set_color green)
        set -l prompt_status ""
        set -l duration

        if test $CMD_DURATION -ne 0
          set duration ( echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2 }')
          set prompt_status $status_color_right_prompt "[ " $duration " ]"
        end

        # Color the prompt in red on error
        if test $last_status_right_prompt -ne 0
          set status_color_right_prompt (set_color $fish_color_error)
          set prompt_status $status_color_right_prompt "[ " $last_status_right_prompt " ]"
        end

        echo -s  $vcs_color (fish_vcs_prompt) ' ' $prompt_status
end
