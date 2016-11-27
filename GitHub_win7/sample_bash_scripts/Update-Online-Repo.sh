# simple bash script
# this script will add and commit all changes
# it also pushes all changes up to the online repo
# use single quotes to pass in the commit comment string as first argument
# Execution Syntax:  ./<name-of-this-script> '<your comments for the commit operation'

echo on 
git add --all
git status
git commit -m "$*"
git log -n 1
git push
