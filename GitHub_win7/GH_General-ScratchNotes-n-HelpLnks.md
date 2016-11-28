
# About This Content

This file has a list of all commands mentioned in one or more of the video URLs provided below.  It also has some related help content and references.  In this and all subsequent documents:
- $ = command prompt, content following this symbol represents a git command
- \. and \.\. = current directory and one directory up (same syntax in Windows/DOS and LINUX)

## About this File:
- it is scratch notes from early attempts to learn Git
- following some of the command chains (exactly as described in video links) failed w/ unexpected errors
- this content preserves command lists from watching videos almost like a data dump with notes
- other content files on this project are better organized by topic and lesson
- but this content may still be useful to refer to

## TOC
In this file:
- Tools, Tutorials, and General Help Information
- Scratch Notes on Commands For Different Tasks
  - has command lists of tasks to use in common basic tasks
  - Subsections with hyperlinks to more help on the web:
    - Modifying a Project - Deletes and Renames
	- Future Research
	  - has links relating to useful topics many of which do not have command lists in this file.
	  - as topics get written, they will form new files in this project rather than being edited here.

**----**

# Tools, Tutorials, and General Help Information

## Tools and Sites Recommended in GitHub Trainings:
- VIM (text editor)
- Site:  www.initializr.com 

Note:  Git integrates with "Clear Case" and "Subversion" (mentioned in intro training videos)

## Training Videos and Content (Git)
- https://www.youtube.com/watch?v=HVsySz-h9r4
   Video by Corey Schafer (has many, this one was: "command line basics")
  
- https://www.youtube.com/watch?v=ugN-IYV1NTM#t=981.252081
  - 90 minute more detailed video by Timothy Corey (Lessons created from this author)
  - More by same author:
     + https://www.youtube.com/watch?v=_vEPmy31XDE
       ++ 20 minute overview of history and how it works:  no demos of actually working in Git
  
     + https://www.youtube.com/watch?v=iIjl4mj4AMc#t=899.097549
       ++ Install Git on a Macintosh inclusing package managers for different OS's, etc. 
  
     + https://www.youtube.com/watch?v=vBLjB7PZoK0#t=3.375194
       ++ Undoing changes in GIT (30 min)
<br/>  
- git-scm.com/downloads
  - to download Git Desktop<br/>
  
- some help links and resources found while exploring initial setup:
  - https://guides.github.com/activities/hello-world/
  - https://help.github.com/articles/set-up-git/
  - https://help.github.com/categories/bootcamp/

- some help links and resources found while looking into installation of Git Desktop:
  - https://git-scm.com/doc
  - Git Pro (book) available online for free:  https://git-scm.com/book/en/v2
    + **note:** has link to download PDF as well for offline copy
<br/>

Helpful commands - UNIX for DOS/Windows Users:  
- http://www.yolinux.com/TUTORIALS/unix_for_dos_users.html

### Excerpt from above book on getting help on Git

Getting Help:<br/>
If you ever need help while using Git, there are three ways to get the manual page (manpage) 
help for any of the Git commands:

- $ git help <verb>
- $ git <verb> --help
- $ man git-<verb>
  - this command did not work on my Windows 7 installation (using Git Bash)

For example, you can get the manpage help for the config command by running

- $ git help config

These commands are nice because you can access them anywhere, even offline. 
If the manpages and this book aren’t enough and you need in-person help, 
you can try the #git or #github channel on the Freenode IRC server (irc.freenode.net). 

These channels are regularly filled with hundreds of people who are all very knowledgeable 
about Git and are often willing to help.

----

## Interesting Projects on GitHub (other users)

https://github.com/geekcomputers

Find other interesting projects and code-bases:<br/>
https://github.com/explore/

----

# Scratch Notes on Commands For Different Tasks

## After Installation of Git Desktop (command line interface):

- $ git config --global user.name "username"
- $ git config --global user.email "email@email.com"
- $ git --version
- $ git
  - all by itself lists all git commands

## Clone repository off GitHub

- git clone "https://github.com/ ...<project on Github>" .
  - \. is local folder (cd to it first or put in path where to clone to)

- $ git status
  - find out what needs to be added / committed back to remote project

- $ git add <file-name>
- $ git add -A
  - add all files in local project

- $ git commit -m "comment for commit"
- $ git push

### Git Project Update (work on cloned project from online repo)

- $ git pull
  - pull down all content to make sure project is up to date

Other commands:<br/>
- $ git log
  -  shows all previous commit activities and shows if project is up to date at end of log
  
----

## Git Set Up Local to use Remote Project without Cloning
**(Project exists but has nothing it in, now want to use what is on PC to build remote project)**

- $ git log
- $ git remote add origin "https://github.com ... <project>"
- $ git push -u origin master
- $ git push
  - subsequent updates after first one using "-u origin master"

Later:<br/>
$ git pull origin master

----

## Misc. Commands

- $ git init
  - creates .git folder
  - can delete or "rm - r .git" (to remove the folder so folder is not trackd on git)

- $ touch .gitignore
  - build ignore file (list files to ignore during updates in this file)

- $ git add -A
  - adds all to staging area (not committed yet)

- $ git reset HEAD <filename>
  - removes file from staging so it won't be committed

- $ git reset
  - removes all files from staging so they won't be committed

- $ git diff
  - shows differences in code file(s)
  
- $ git remote -v
  - shows files in remote repo

- $ git branch -a
  - lists all branches (remote and local)

- $ git pull original master
- $ git push original master

UNIX from demo?<br/>
ls -la (lists files)


----

## Branching / Merging
Branching:
- $ git branch
  - lists branches

- $ git branch <branch name>
  - provides info on branch of given name

- $ git checkout <branch name>
  - check out branch to work on it

- $ git push -u origin <branch>
- $ git branch -a


Merging:
- $ git checkout master
- $ git pull origin master
- $ git pull origin master
- $ git branch --merged
  - tell us what has been merged so  far

- $ git push origin master
- $ git branch --merged
  - check what was merged
- $ git branch -d <branch name>
  - deletes branch (locally)
- $ git branch -a
- $ git push origin --delete <branch name>
  - delete branch remotely

----

## Modifying a Project - Deletes and Renames

Deleting / renaming files:<br/>
http://stackoverflow.com/questions/5551556/changing-file-names-in-git-repo

Deleting and renaming files in GUI so they change folders in process<br/>
https://github.com/blog/1436-moving-and-renaming-files-on-github

Deleting / renaming folders:<br/>
http://stackoverflow.com/questions/31861651/how-to-rename-a-directory-folder-in-githubweb
    
----

## Future Research
These topics may have already been used in some of the other lesson files but were preserved here
during the early stages of the Git testing and experimentation behind this project.

- https://code.tutsplus.com/tutorials/quick-tip-how-to-work-with-github-and-multiple-accounts--net-22574
  - has instructions for setting up GIT for multiple accounts - personal and work
  - using SSH instead of HTTP for Push/Pull process

- Help getting started with Bash scripting:
  - https://www.lifewire.com/pass-arguments-to-bash-script-2200571
  - run as:  ./filename.sh from bash prompt

- Help constructing .gitignore files:
  - for templates:  https://www.gitignore.io/
  - for a good sample:  https://gist.github.com/octocat/9257657

- Git alias commands and command writing for bash:
  - https://lukas.zapletalovi.com/2012/07/my-git-aliases-again.html

