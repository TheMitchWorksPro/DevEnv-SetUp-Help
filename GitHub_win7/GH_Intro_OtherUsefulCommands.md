# Other Useful Commands on GIT

Useful LINUX syntax and Git / Bash Commands that can help with general usage
and in the lessons files that make up this project.  Note that many of these commands
do not start with "git" and should be typed as indicated after the $ prompt.
<br/>

For more help using LINUX commands on Git Bash - this command reference can help:
- http://www.yolinux.com/TUTORIALS/unix_for_dos_users.html
- More advanced options: 
  - http://www.faqs.org/docs/abs/HTML/options.html
<br/>

## LINUX and Git Syntx

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
  

<br/>To run a bash script (*.sh):  if in current directory, type whole name with current dir syntax as in:  ./myscript.sh

----

## Common and Useful Git Commands

- $ clear
  - clears the screen, but really it sets position in bash window so screen appears clear
  - do it a second time and the screen clears for real retaining only the previous clear command in the window

----

## Commands used in Debugging of Common Problems:
  
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

- to exclude files across all repositories without writing it to .gitignore (for all projects)
  - note: this means the ignore is local to my machine and does not affect other users who share my project
  - $ .git config --global core.excludesfile <File path>
  - can name it whatever you want
  - example: $ .git config --global core.excludesfile ~/.gitignore_global 

- Tracked files cannot be ignored by default - how to overcome this?
  - $ git rm --cached <filename>
    - this tells git to remove the file not from the repository, but rather, from the staging area  
<br/>

- Empty directories are not tracked - how to overcome this?
  - $ touch .gitkeep
    - creates empty file so git will track the folder
	- git tracks files, not folders and needs a file in the folder to track it 
	
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


  

