# https://junegunn.github.io/fzf/

# -------------------------------- Defaults ---------------------------------------

# https://github.com/junegunn/fzf?tab=readme-ov-file#environment-variables
export FZF_DEFAULT_COMMAND='find . -type f'
command -v fd &>/dev/null && export FZF_DEFAULT_COMMAND='fd --type f'

export FZF_DEFAULT_OPTS="
  --style full
  --layout reverse
  --tmux center
  --border
  --header-first
  --padding 1,2
  --walker-skip .git,node_modules,target
  --no-bold

  --border-label ' Fuzzy Search '
  --color border:$BRIGHTBLACK_HEX
  --color label:$MAGENTA_HEX

  --header 'Preview File/Folder Content'
  --header-label ' Action '
  --color header:$BLUE_HEX
  --color header-border:$BRIGHTBLACK_HEX
  --color header-label:$YELLOW_HEX

  --preview-label ' Preview '
  --color preview-border:$BRIGHTBLACK_HEX
  --color preview-label:$BRIGHTMAGENTA_HEX

  --input-label ' Search '
  --color input:$BLACK_HEX
  --color input-border:$BRIGHTBLACK_HEX
  --color input-label:$RED_HEX
  --color prompt:$RED_HEX
  --color spinner:$CYAN_HEX
  --color info:$RED_HEX
  --prompt '  '

  --list-label ' Results '
  --color list-border:$BRIGHTBLACK_HEX
  --color list-label:$GREEN_HEX
  --color marker:$CYAN_HEX
  --color pointer:$GREEN_HEX
  --color fg:$BRIGHTBLACK_HEX
  --color fg+:$WHITE_HEX
  --color bg+:-1
  --color gutter:-1
  --color hl:$BLACK_HEX
  --color hl+:$GREEN_HEX
  --marker ' '
  --pointer '󰓒'
"

# -------------------------------- Shell Integrations ---------------------------------------

showdir="$(command -v tree &>/dev/null && echo 'tree -aCI ".git|.github" {}' || echo 'ls -lAh {}')"
showfile="$(command -v bat &>/dev/null && echo 'bat -n --color=always {}' || echo 'cat {}')"
showcmd="$(command -v bat &>/dev/null && echo 'bat --color=always -pl sh' || echo 'cat')"  

# https://junegunn.github.io/fzf/shell-integration/#ctrl-t
export FZF_CTRL_T_OPTS="--bind 'ctrl-/:change-preview-window(down|hidden|)' --preview '[[ -d {} ]] && $showdir || $showfile'"

# https://junegunn.github.io/fzf/shell-integration/#ctrl-r
export FZF_CTRL_R_OPTS="--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header         'Press CTRL-Y to copy command into clipboard'
  --preview        'echo {2..} | $showcmd'
  --preview-window 'wrap:up:3'
"

# https://junegunn.github.io/fzf/shell-integration/#alt-c
export FZF_ALT_C_OPTS="--header '󰉖 cd' --preview '$showdir'"

# -------------------------------- 3rd Party Integrations ---------------------------------------

# https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#environment-variables
export _ZO_FZF_OPTS="$FZF_DEFAULT_OPTS --header '󰉖 cd: Zoxide' --preview 'echo {} | cut -f2- | xargs -I{} $showdir'"
