# Setting Up A Project Using "git clone"

## Pre-requisites:

1. Download / Install Github Desktop
2. Setup a new project on Github
   - project should be created with README.MD with some basic idea of what you are creating documented in it

----
   
## About this help topic:  
- This write-up assumes you want to use cloning to set up a project to work on your local machine
- It does not include help for complexities that will arise when you share your project in collaboration with others
   
----
## Setting up Project to work Locally (assumes building new project in empty local folder)
<br/>**Warning!** - in this process you will clone the starter project from Github.
Do not edit in both places (online and local) after cloning or problems will result.

<br/>This walkthrough includes creation of project by cloning, editing adding files locally, sending back to Git,
and finally, editing Readme.md on Git and synching that update to your local copy so work can continue later.

<br/>In the content that follows, "$" represents the prompt, type commands after the "$" as in:
- $ git
  - All you type is "git" to get a list of all git commands

- From Github Desktop, use these commands:
  - $ cd "root folder for your git project"
    - note:  
	  - on windows, choose a working location that is not too deep.  
      - If paths gets to be 260 characters or more in length, it may fail
	  - Depending on your installation, you may need to convert paths from "c:\mypath\folder" to "c:/mypath/folder"

- $ git clone <URL to clone from project you created on Github>
- $ cd "projectName" 
  - this will be last folder in URL you used to clone
  - this will be the project folder locally after you clone it
  - you can test with "dir" before changing directory
  
<br/><br/>Your project should now be ready to use.  On bash, you should see "(master)" at end of the path you are in.

## Edit Some Files Locally.
Edit process (except first time you do it), is pretty much the same whether you clone a project or initialize it as explained
in the next lesson.
- $ git status
  - should show you what was edited so you can enter commands to update on Git (online)
<br/>

- Use this approach:
  - either individual commands like the ones shown for files that need updating
  - use -A switch to add all new content
<br/>

- $ git add myFile.ext
- $ git add someFolder\myfile.ext
- $ git add someFolder\

<br/>
- $ git add - A
  - this also works:  git add .
  - to get it to skip some files:
    - touch .gitignore
	  - this creates above file
	  - edit file with list of files to ignore
	  - wild card patterns are allowed
	  - then git status will no longer show changes to these files
	  - and git add -A will ignore these files
  
### These commands commit your changes and finalize them on Git:

- $ git commit -m "brief description of what changed for the log"
  - suppose you do the commit, then make another edit or realize you want to add more files?
  - after completing the changes and add them, you can use:  git commit --amend
  - make a mistake?  
    - git reset
	  - uncommits everything so nothing is staged to be pushed
	  - options can tell what to reset (if not looking to reset all)
	  - typical reset of just one file:  $ git reset HEAD <filename>

### Combining the add and commit steps in one command:

- $ git commit -a -m "brief description of your changes"
- $ git commit -am "brief description of your changes"
  - note that this combination may not pick up completely new "untracked files"
  - note that this option also does not address deleted / renamed files and folders
  - regarding new untracked files:  substituting --all for -a does not resolve this issue
  - the --all will address any deleted or removed files (just not untracked files)
  - if "git status" still shows untracked files, try adding them seprately and then committing the new files

### Made changes?  update / ammend the previous commit before pushing:

- $ git commit --amend  
- $ git push

### Updates involving removal of files - note that wildcard "*" must be escaped:

- $ git rm mydir/\*.log
  - removes all .log fils in mydir 
  - then commit and push just like an add command to finalize the changed

<br/>
- $ git rm <file-name>
  - works like git add but removes file and updates the staging index for the file
  - this remove deletes it fully (does not leave one in recycle bin)

<br/>
- $ git mv <file> <renamed file>
  - move command can rename files and record in index
  - use paths in syntax to move the file from source to target

<br/>  
- $ git add --all
  - this is supposed to add all changes including multiple deletes (of files), renames, etc.
  - in testing:  deleted a .docx and added a PDF - it made both changes
  - in video:  instructor deleted all folders on a branch and this add picked up the entire whipe-out change  

<br/>  
- Make a change back in the online project (Git remore repo at internet URL):
  - before you change anything locally you need to pull and merge into the local project
  - simply use this command and it should solve the problem:
    - $ git pull
    - if no changes exist to pull - you will get an up-to-date message
    - note above syntax assumes simple project setup (master branch which is created by default)	

<br/>
- $ git log 
  - can show all commits that have taken place
