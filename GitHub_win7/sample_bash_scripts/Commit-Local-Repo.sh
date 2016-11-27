# simple bash script
# this script will add and commit all changes to local working project
# it uses status and log commands to show what is happening along the way
# use single quotes to pass in the commit comment string as first argument
# Execution Syntax:  ./<name-of-this-script> '<your comments for the commit operation'

#!/bin/bash
set -o verbose
git add --all
git status
git commit -m "$*"
git log -n 1
set +o verbose
