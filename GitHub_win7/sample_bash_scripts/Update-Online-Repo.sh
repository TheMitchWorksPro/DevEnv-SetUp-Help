# simple bash script
# this script will add and commit all changes
# it also pushes all changes up to the online repo
# use single quotes to pass in the commit comment string as first argument
# Example:  ./Update-Online-Repo.sh 'Replaced $ w/ - \$ throughout text file content'

git add --all
git status
git commit -m "$*"
git push
