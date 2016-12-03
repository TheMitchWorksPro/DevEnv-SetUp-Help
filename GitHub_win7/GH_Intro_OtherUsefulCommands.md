# Other Useful Commands on GIT

This topic organizes misc. useful commands into these sections:

1. LINUX and Git Syntx
2. Common and Useful Git Commands
3. Commands used in Debugging of Common Problems
  1 .gitignore and related setup and debugging help
4. Stashing Changes (to Commit Later) and Accessing What is Stashed - Used to Avoide Merge Conflicts
5. Basic Help Commands
6. Dangerous Commands

## LINUX and Git Syntx

Useful LINUX syntax and Git / Bash Commands that can help with general usage
and in the lessons files that make up this project.  Note that these commands
do not start with "git" and should be typed as indicated after the $ prompt.
<br/>

For more help using LINUX commands on Git Bash - this command reference can help:
- http://www.yolinux.com/TUTORIALS/unix_for_dos_users.html
- More advanced options: 
  - http://www.faqs.org/docs/abs/HTML/options.html
<br/>

- $ ls - la
  - list all files showing file sizes (does not show what is in sub folders - just current folder or directory)

- $ ls - la .git
  - get listing of files (l = files, a = hidden files) in directory specified, in this case:  .git
  - drill in deeper with:  ls -la <folder name>/<subfolder name> 

- Typing file paths:  make sure to use "/" not "\"
 - "\" is treated as the escape character
 - Example:  c:/myfolderTree/myfolder/mysubfolder/myfile.txt
 
- $ cd ~
  - goes to user directory
  
- $ touch \<file\>
  - creates a file
  
- $ cat \<file\>
  - views contents of a text file
<br/>

To run a bash script (*.sh):  if in current directory, type whole name with current dir syntax as in:  ./myscript.sh

----

## Common and Useful Git Commands

- $ clear
  - clears the screen, but really it sets position in bash window so screen appears clear
  - do it a second time and the screen clears for real retaining only the previous clear command in the window

----

## Commands used in Debugging of Common Problems:

Push fails due to conflicts on Remote Server:  
- $ git fetch 
- $ git merge
- $ git push
  - steps are fetch from remote, then you can check with $ git diff between local and remote copy of the branch
  - if all is well, merge the branches
  - then push will working
  - see branching topic for full merge syntax examples  

Other commands:  
- $ git push -f 
  - force the push
  - common usage:  Git thinks something changed on the remote (online) repository but you know nothing has changed
  - use this to force your push to go through and over-write what is on git repository  
<br/>

- $ cat .gitconfig
  - displays .gitconfig
  - must use cd ~ to get to correct directory first
<br/>

- $ git config --global color.ui true
  - use this to set bash screen to show things in color if not doing this already
<br/>

- Example of deleting a branch:
  - old way:  $ git push origin :\<name-of-branch-to-delete\>
    - the : tells it to delete the branch from the remote called "origin"
	- why this works:
	  - standard push = $ git push origin name-of-branch-to-delete
	  - this is short hand for - $ git push origin name-of-branch:name-of-branch
	    - before colon:  local copy of branch
		- after colon:  remote branch we want to push to
		- shorthand works because if only one, git assumes names are the same
		- put in colon and leave first one blank and git is being told to push nothing up to the remote branch
  - new way:  $ git push origin --delete \<name-of-branch-to-delete\>  
<br/>

### .gitignore and related setup and debugging help

- to exclude files across all repositories without writing it to .gitignore (for all projects)
  - note: this means the ignore is local to my machine and does not affect other users who share my project
  - $ .git config --global core.excludesfile <File path>
  - can name it whatever you want
  - example: $ .git config --global core.excludesfile ~/.gitignore_global 
<br/>

- Tracked files cannot be ignored by default - how to overcome this?
  - $ git rm --cached <filename>
    - this tells git to remove the file not from the repository, but rather, from the staging area  
<br/>

- Empty directories are not tracked - how to overcome this?
  - $ touch .gitkeep
    - creates empty file so git will track the folder
	- git tracks files, not folders and needs a file in the folder to track it 
<br/>

- URLs / Templates to help set up .gitignore files:
  - https://help.github.com/articles/ignoring-files
  - https://github.com/github/gitignore 
<br/>

- Helpful syntax tips for .gitignore file
  - basic regular expression support: * ?[aeiou][0-9]
  - negate wild-card expressions using "!"
    - *.php
	- !myFileToInclude.php  

## Stashing Changes (to Commit Later) and Accessing What is Stashed - Used to Avoide Merge Conflicts
	
- $ git stash save "my message to store with my stashed changes"
  - stashes all changes without committing them for future
  - system may tell you to do this when you switch branches if there is a conflict between branches
  - theoretically, stash your changes, switch branches, commit later
  - when run:  does a hard reset so that our conflicting changes are stashed and we now match the repo to move forward
  - has options to look up in helpfile for untracked files otherwise, default deals with tracked files only
    - if you added new files, deleted files, or renamed files, may need these options  

- $ git stash list
  - provide list of changes in the stash (showing the descriptions we saved them with)
  - stash presents each item with identifiers of form:  stash@{0}, stash@{1}, etc.
  - stash available from any branch and lists changes with info on what branch the change occurred on
  - you do not have to switch branches to use the stash - just reference right element on the stash  

- $ git stash show @stash{0}
  - this would show us the first element on the stash with "diff stats summary" for it
  - more detail, add -p option to show "as patch" (like -p option on log):
    - $ git stash show -p @stash{0}
	- shows actual edits (full diff)  

- $ git stash pop
- $ git stash apply
  - default grabs stash@{0}
  - normal usage (examples):
    - $ git stash pop stash@{1}
	- $ git stash apply stash@{4}
  - attempts to merge in changes from the stash
  - will merge them in regardless of branch we are on (do not have to merge back to original branch)
  - git pop versus git apply:
    - pop = pops it off the statsh queue (removing it from stash) and adds to working directory
	- apply = applies it to working directory but leaves a copy in the stash
	  - use case for apply:  apply to current branch, switch to another branch and apply there, and to another branch to apply there ...
	  - use case pop:  want to apply it to current branch just the one time to simply commit it back from current branch
	- if no conflicts, changes merge into current working directory  

- $ git stash drop stash@{0}
  - removes an item from the stash
  - use cases:  
    - no longer need change (do not intend to do it after all)
	- change applied multiple times to different branches, now we are done with it and want it off the stash  

- $ git stash clear
  - dangerous command:  permanently whipes all changes in the stash
  - use case:  don't need anything on the stash and do not want to delete them one by one   
	  
----
## Basic Help Commands

Try all of these for different help pages:
- $ git help
- $ git help \<command\>
  - Example:  - $ git help fetch
- $ git help -all
- $ git help -g

## Dangerous Commands!
  
- $ git clean -f
  - removes untracked files from working directory all in one shot
  - can use windows to delete files instead, but this may make process easier
  - this is more dangerous because files are permanently gone (not even in the trash)
- $ git clean -n 
  - test run:  shows what will / will not be removed if we run for real
<br/>
