# Informational Commands on Git (Used To Find Out About Your Project And It's State)

- \$ git config --list
  - shows all configuration settings for this Git session
  
- \$ git config --global --list
  - shows just global variables

- \$ git config --global <variable name>
- \$ git config <variable name>
  - get individual local (to the project environment) and global variables
    
- \$ git remote -v
  - lists remote repositories (associated to this working folder)

- \$ git branch -a
  - lists branches for our working folder project (all branches local and remote)

- \$ git branch
  - on a local unbranched project, this would return "master"
  - might be just local branches, need to test for difference w/ git branch -a 
  
- \$ git status
  - get status of all adds / commits / changes (what's tracked / what's not tracked) on current branch

- \$ git log
- \$ git log -n 2
- \$ git log --since=5/1/2016
- \$ git log --until=6/14/2016
- \$ git log --since=5/1/2016 until=6/14/2016
- \$ git log --author="Mitch"
- \$ git log --grep=<LINUX grep commands here to search log>
  - shows log of recent activities (commits)
  - the -n switch tells it to start with most recent in log and display only this number
  - since / until - use these to carve out by date what entries you wish to see
  - author is a pattern match getting just log entries with "mitch" in the name (for example)
  - grep stands for:  Global Regular ExPression search; simple example:  grep="bug" (all entries with text "bug" in them for bug fixes)
  
- \$ git --version
  - what version of Git we are using

- \$ git diff 
  - what's different between remote repo and local repo
  - if changes big you see a :
  - windows: can use arrow keys to scroll down in difference log
  - when you get to end, use "q" to quit
  - expected commands:  f and b for forward and backwards through each page of content and q to quit
  - hitting other keys can have strange and unexpected behaviors on the screen but you can still use "q" to get out  

- \$ git diff --staged
  - older versions of git use --cached
  - compares staging index instead of local directory to remote repo
<br/>

Useful informational command:  what does head point to?
- \$ cat .git/head
  - this returns a reference path like this:  ref: refs/heads/master
  - use cat .git/<ref path> to get SHA ID of commit head points to as in:
    - cat .git/refs/heads/master

<br/>

Need to do something using LINUX tools on Bash?  This command reference can help:
- http://www.yolinux.com/TUTORIALS/unix_for_dos_users.html
  
 