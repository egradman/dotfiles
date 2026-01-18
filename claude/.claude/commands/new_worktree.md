We're creating a new worktree called "$ARGUMENTS"

First, examine your working directory.  If you are in a subdirectory of "worktrees" you should not continue and explain that this command should be run from top level.

Otherwise, ensure the "worktrees" directory exists.  Then, create a NEW git worktree for branch $ARGUMENTS in `./worktrees/$ARGUMENTS`
