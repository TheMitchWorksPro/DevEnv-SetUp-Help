# Other Useful Commands on GIT
This topic organizes misc. useful commands into these sections:

1. LINUX and Git Syntx
2. Common and Useful Git Commands
3. Commands used in Debugging of Common Problems
  1 .gitignore and related setup and debugging help
4. Basic Help Commands
5. Dangerous Commands

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
  
- $ touch <file>
  - creates a file
  
- $ cat <file>
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
	
----
## Basic Help Commands

Try all of these for different help pages:
- $ git help
- $ git help <command>
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


  

