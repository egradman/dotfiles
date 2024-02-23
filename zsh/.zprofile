if [ "$IS_MAC_LAPTOP" = true ] ; then
  eval $(/opt/homebrew/bin/brew shellenv)

  eval "$(ssh-agent -s)"

  ssh-add ~/.ssh/id_rsa

  export JIRA_API_TOKEN="ATATT3xFfGF0sMF-jaCUMpbrkFKDp04QDKo-CPNlFP8iAFhkBFboTHi4aEltKAgUCYxQHv33y6Li3sZYa-EB5Zi6CXHw-lpVwJg7jvgRbAeyEpqCMSGm6wFfvZvJ6a-nn_ZEeurqUzvBylxgxYC5-yt9MdrTKIHozCs81gCVxOfAxBJFsnO6zWM=26301091"
fi

alias vim=nvim
alias vi=nvim
alias cat=bat
alias less=bat

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
