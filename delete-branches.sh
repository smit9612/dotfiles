# http://stackoverflow.com/questions/32122784/alias-script-to-delete-all-local-and-remote-git-branches-with-a-specific-prefix
git branch -D $(printf "%s\n" $(git branch) | grep $1)

# Or this will work too to remove all remote branches:
# https://coderwall.com/p/eis0ba/remove-a-thousand-stale-remote-branches-on-git
git branch -r | awk -F/ '/\/feature/{print $2}' | xargs -I {} git push origin :{}

# Prune all origin branches 
git remote prune origin
