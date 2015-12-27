#!/usr/bin/env zsh

# my environment, aliases and utility functions
[[ -s "$MYZCONF/zsh_env" ]] && source "$MYZCONF/zsh_env"
[[ -s "$MYZCONF/zsh_penv" ]] && source "$MYZCONF/zsh_penv"
[[ -s "$MYZCONF/zsh_aliases" ]] && source "$MYZCONF/zsh_aliases"
[[ -s "$MYZCONF/zsh_functions" ]] && source "$MYZCONF/zsh_functions"
[[ -s "$MYZCONF/zsh_completions" ]] && source "$MYZCONF/zsh_completions"
[[ -s "$MYZCONF/zsh_keybindings" ]] && source "$MYZCONF/zsh_keybindings"

