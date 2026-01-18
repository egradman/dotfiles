use /ralph-loop:ralph-loop --prompt "complete all the beads with label $ARGUMENTS. use a new subagent for each bead. when all the beads are closed, output a promise <promise>TASK COMPLETE</promise>." --max-iterations 5 -completion-promise "TASK COMPLETE"

When you're finished, /ralph-loop:cancel-ralph
