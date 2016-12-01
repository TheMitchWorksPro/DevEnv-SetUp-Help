# Informational Commands on Git (Used To Find Out About Your Project And It's State)

- $ git config --list
  - shows all configuration settings for this Git session
<br/>
  
- $ git config --global --list
  - shows just global variables
<br/>

- $ git config --global <variable name>
- $ git config <variable name>
  - get individual local (to the project environment) and global variables
<br/>
    
- $ git remote -v
  - lists remote repositories (associated to this working folder)
  - without -v:  just repostories listed like:  "origin" (blank if none)
  - with -v:  lists full URL for Fetch and Push operations
<br/>

- $ git branch
  - on a local unbranched project, this would return "master"
  - this provides list of local branches in working folder 
- $ git branch -r
  - provides just remote branches
- $ git branch -a
  - lists all branches, both local and remote
  
<br/>
  
- $ git status
  - get status of all adds / commits / changes (what's tracked / what's not tracked) on current branch
<br/>

- $ git log
- $ git log -n 2
- $ git log --since=5/1/2016
- $ git log --until=6/14/2016
- $ git log --since=5/1/2016 until=6/14/2016
- $ git log --author="Mitch"
- $ git log --grep=<LINUX grep commands here to search log>
  - shows log of recent activities (commits)
  - the -n switch tells it to start with most recent in log and display only this number
  - since / until - use these to carve out by date what entries you wish to see
  - author is a pattern match getting just log entries with "mitch" in the name (for example)
  - grep stands for:  Global Regular ExPression search; simple example:  grep="bug" (all entries with text "bug" in them for bug fixes)
<br/>

- $ git log --oneline -5 
- $ git log --oneline origin/master 
- $ git diff origin/master..master 
  - first variation: displays all log entries as single line with just the first commit message line showing
    - optional last argument "-#" is number of lines to display; if left all, whole log is returned
  - second variation:  adding "oring/master" shows the local copy of the remote log (which will not have changes made locally so far yet)
  - git diff ... compares the local and remote branches showing what is different
<br/>
  
- $ git --version
  - what version of Git we are using
<br/>

- $ git diff 
  - what's different between remote repo and local repo
  - if changes big you see a :
  - windows: can use arrow keys to scroll down in difference log
  - when you get to end, use "q" to quit
  - expected commands:  f and b for forward and backwards through each page of content and q to quit
  - hitting other keys can have strange and unexpected behaviors on the screen but you can still use "q" to get out  
<br/>

- $ git diff --staged
  - older versions of git use --cached
  - compares staging index instead of local directory to remote repo
<br/>

Useful informational command:  what does head point to?
- $ cat .git/head
  - this returns a reference path like this:  ref: refs/heads/master
  - use cat .git/<ref path> to get SHA ID of commit head points to as in:
    - cat .git/refs/heads/master
<br/>

-  cat .git/config
   - view project configuration including remote URLs and branches 
<br/>

Need to do something using LINUX tools on Bash?  This command reference can help:
- http://www.yolinux.com/TUTORIALS/unix_for_dos_users.html
- http://www.faqs.org/docs/abs/HTML/options.html
  
 