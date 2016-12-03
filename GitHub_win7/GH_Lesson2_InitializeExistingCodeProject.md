# Initialize Existing Code Project in Working Local Code Folder

## About this help topic:  
This lesson includes initializing an existing code project folder (without cloning).
It also further explores some of the command basics that work for either cloned or initialized
projects.  Note:  LINUX commands and bash syntax apply as in earlier lessons.
<br/>

- This write-up assumes you want to use this process to setup and update your local projects against an online repo
- It does not include help for complexities that will arise when you share your project in collaboration with others

----
## Commands Explained:

- $ ls -la
  - list files
<br/>

- $ git init
  - builds .git folder and initiates tracking for git
  - do this from the folder you want to initialize
<br/>

- $ git init my_project
  - will build the subfolder and initialize it
<br/>

- $ rm -rf .git
  - removes .git folder and effectively stops tracking this code folder (reverses git init)
  - note:  this is a LINUX command, not a git command (called in bash as a LINUX tool)
  - you will know it worked because after removal of the .git directory, the directory will stop listing with the (branch) 
  - example:  before -- c:\myGitRepo (master)  after -- c:\myGitRepo 
<br/>
  
- $ git status
  - check what is in project and at this stage is untracked
  - can use this command at any time for status of project before executing commands
<br/>

- $ touch .gitignore
  - touch creates a blank text file using name specified
  - .gitignore is used to build a list of files to ignore (edit manually to add files to ignore)
  - .gitignore can take wild card arguments like:  myPattern*.*
  - if using paths to a file, use "/" as in:  myfolder/myfile.txt
<br/>
  
- $ git remote add origin \<url to remote project\>
  - add local project to remote repository (at URL provided)
<br/>
  
- $ git remote
  - shows all remotes hooked up to this local project (will say "origin" right after previous command)
<br/>

- $ git push -u origin master
  - use -u switch first time only to get content pushed up to new remote repository
  - may be prompted for password to remote repository (or login popup may occur)
  - this command not needed for first push after cloning operation;  Only needed here for folder we initialized
<br/>
  
Then: you should be able to use same add, commit, push commands as in lesson 1 once all is set up

----

## Step-by-Step Example - Initializing a Project
<br/>

- $ git init
  - initializes project (in this case - folder with existing code to add to remote repo)
<br/>
  
- $ git status
  - check status of project -- if uncommitted, then execute next command to commit all uncommitted content
<br/>

- $ git commit -a -m "Initial Commit"
  - if this fails, break it apart to these commands:
  - git add .
  - git commit -m "Initial Commit"
<br/>

- $ git remote add origin https://github.com/TheMitchWorksPro/TestProject.git
  - added the wrong remote?  remove it with:
    - $ git remote rm \<remore alias\>
    - example:  $ git remote rm origin
<br/>

**Note:**  Before this step, the above repository must be created on GIT if it is not there already.
- If your local project already has README.MD, .gitignore, or License files - do not create them in the project on GIT
- syntax which follows is for first push only ...
<br/>

- $ git push -u origin master
  - u = sets the push up to be tracked
  - note that during cloning this is done automatically but for this process it needs to be set up 
<br/>

Subsequent pushes can use:  - $ git push

----

## Re-Initializing a Project to kill its tracking history
- use case:  tracking takes space on hard drive
  - at some point it may be clear that full tracking history is no longer needed
  - it is then desirable to get rid of it and recover the space before adding more new commits
- this process should allow a reset as if project were new
- once done, all previous commit history is lost and only current and go-forward remains
- **warning!** If successful, this will make it impossible to roll back the project since earlier commits are whiped out.
<br/>

Idea to be tested:

1. Kill .git folder using:  rm -rf .git
2. Perform any final changes that will become the new live content
3. Delete project on GIT
4. Re-create project (do not create Readme.md, or other starter fils project already has)
5. Follow initialization steps and commit the local project back to new online repo as intial commit


  

