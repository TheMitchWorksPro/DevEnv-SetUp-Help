# Informational Commands on Git (Used To Find Out About Your Project And Its State)

TOC:
- Main List
  - good general reference and many are useful to know ahead of trying the lessons in this project
- Working with Git Log and Diff commands
- Advanced List
  - includes tree navigation (an advanced topic)

## Main List
Good reference for before you begin and as you progress through lessons in this project

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

- $ git --version
  - what version of Git we are using
<br/>

Useful informational command:  what does head point to?
- $ cat .git/head
  - this returns a reference path like this:  ref: refs/heads/master
  - use cat .git/\<ref path\> to get SHA ID of commit head points to as in:
    - cat .git/refs/heads/master
<br/>

-  cat .git/config
   - view project configuration including remote URLs and branches 
<br/>

Need to do something using LINUX tools on Bash?  This command reference can help:
- http://www.yolinux.com/TUTORIALS/unix_for_dos_users.html
- http://www.faqs.org/docs/abs/HTML/options.html

## Working with Git Log and Diff commands

There are so many options here that this merits its own section.  Note that Advanced Topics section has information about
tree-ish syntax that can be used with many of the commands below to establish start ... end ranges.

- $ git log
  - if log is long - use space bar or forward/back arrows to page through it
  - use "q" to quit out of it 
- $ git log -n 2
- $ git log --since=5/1/2016
- $ git log --until=6/14/2016
- $ git log --since=5/1/2016 until=6/14/2016
- $ git log --author="Mitch"
- $ git log --grep=\<LINUX grep commands here to search log\>
  - shows log of recent activities (commits)
  - the -n switch tells it to start with most recent in log and display only this number
  - since / until - use these to carve out by date what entries you wish to see
    - these support the following syntax as well as putting in dates:
	  - --since "3 weeks ago" -- until "2 weeks ago"
	  - same as above:  --since 2.weeks --until 2.days
	    - this would be from 2 weeks ago up until 2 days ago
  - author is a pattern match getting just log entries with "mitch" in the name (for example)
  - grep stands for:  Global Regular ExPression search; simple example:  grep="bug" (all entries with text "bug" in them for bug fixes)
<br/>

- $ git log --oneline -5 
  - displays all log entries as single line with just the first commit message line showing
  - optional last argument "-#" is number of lines to display; if left all, whole log is returned
  - in this example:  shows last 5 log entries displayed as just one line each 
- $ git log --oneline origin/master 
  - adding "oring/master" shows the local copy of the remote log (which will not have changes made locally so far yet)
- $ git log --format=oneline
  - includes whole SHA-ID instead of truncating it the way just "--oneline" does 
- $ git log --format= <\short | medium | full | fuller | email | raw\>
  - default:  $ git log --format=medium  
  - other options give you short (drops some info), full (more detail), fuller (more detail than that)
  - other options:  email (good for emailing), raw (has good info such as tree id and parent)
- $ git diff origin/master..master 
  - compares the local and remote branches showing what is different
  - same syntax is supported to get range of entries relating to this in the log
- $ git log 2907e40a..2909e51b
  - shows range of log entries from first SHA-ID to second one
  - typically, look at larger set of the log, find start and end point for section to view, and enter this command
  - can be done with --oneline on end to just see this short list all displayed on one line
- $ git log 2907e40a.. index.html
  - shows all changes to the file "index.html" since the commit given
  - to restrict this to a specific range, just add an end-point sha-id as in:
    - $ git log 2907e40a..2909e51b index.html
- $ git log -p
  - "patch option"
  - includes diff on each change in the log showing whole log with what changed in the log (good to restrict this with other options for shorter output)
  - combine with above by starting with "git log -p" and then adding other options given in this list
- $ git log --stat --summary
  - provides statistics and summary on the log  
  - does not provide details, but does provide nice informational stats and summation of what changes occurred 
- $ git log --graph --all --decorate --oneline -5 
  - can use any combination of these
  - this is a good combination to get a view of last 5 elements in the log (leave off -5 to page through whole thing)  
<br/>

- $ git show \<SHA-ID\>
  - example:  $ git show 514e41a7
  - shows this element identified by SHA-ID (from the log) - includes the diff on the commit (before/after)
  - can combine with --oneline and --format= ...
  - can handle tree-ish syntax from start of these notes:  blobs, trees, tags, commits
	- Example (tree SHA-ID):  $git show 76f8114319
	  - returns list of what this tree contains (files and folders)
	- Example (blob/file SHA-ID):  $git show 76ab114319:  
	  - returns:  shows what is in the file (if it is text based)
	- Note:  needs a "tree-ish" - HEAD, Master, or SHA-ID;  pass in file name like "index.html" and it will fail
	- More info on tree-ish is under "Advanced Topics" in this file
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

- $ git diff \<SHA-ID\> 
  - compares what has changed between current working directory and ID references from git log
  - Example:  $ git diff 578x1234
- $ git diff \<SHA-ID\> \<filename.ext\>
  - compares what has changed between current working directory and ID references from git log for specified file
  - Example:  $ git diff 578x1234 myFile.txt
- $ git diff \<SHA-ID\> 
  - compares what has changed between current working directory and ID references from git log
  - Example:  $ git diff 578x1234
- $ git diff \<SHA-ID\>..\<2nd SHA-ID\>
  - compares what has changed between two SHA-IDs from the git log
  - Example:  $ git diff 578x1234..579x1235
- $ git diff \<SHA-ID\>..\<2nd SHA-ID\> \<filename.ext\>
  - compares what has changed between two SHA-IDs from the git log but just for the specified fie
  - if the file specified did not change, it will return nothing
  - Example:  $ git diff 578x1234..579x1235 myFile.txt
- $ git diff -b | -w \<combine with other options\>
  - add these switches to ignore eichter changes to:
    - -b = changes to spaces
    - -w = more comprehensive:  ignore all white space related changes of any kind	
	- in large commit log, we usually don't care about this so these are useful filters
- Note:  many if not all options for log also work with diff  
<br/>
  
## Advanced Topics

Includes notes on Tree-ish and navigating the tree.  Tree-ish is used in documentation and can be thought of as a commit 
or reference to somewhere on the git tree. These commands that use tree-ish should make it a bit more clear.    

Note:  ls-tree command will list "blob" and "tree" objects.  "blob" = file on the tree.

- Useful syntax for navigating the tree
  - *^* = add to end of a reference to refer to the parent instead of the item in question or to go up a level
  - Examples:  HEAD^, master^, 8745369^
    - in each example, this means go up one level (like up arrow) from item given
  - Examples:  HEAD^^, master^^, 8745369^^
    - means grandparent, or parent of parent of item shown
  - *~* = used same way but *~#* allows simple specification of how many levels to go up
    - Examples:  
	  - HEAD~2 = grandparent of Head
	  - HEAD~4 = go up 4 levels above HEAD (parent of great grandparent of HEAD)
	  - HEAD~ = HEAD~1 = HEAD^ = parent of HEAD (useful for consistent syntax if usually using "~#" for its compactness)
  - Note:  navigating "up" from master is more like navigating back in time through the log of commits 

- Basic Tree navigation 
  - $ git help ls-tree
    - returns help on the ls-tree git command (works like ls UNIX command but for the Git tree)
  - $ git ls-tree HEAD
    - will list files in current branch, current project
	- note:  anything in working branch that .gitignore says to ignore will not be on this list (shows what Git sees)
  - $ git ls-tree \<branch\>
  - $ git ls-tree \<branch>\ \<folderpath/\>
    - Examples:  
	  - $ git ls-tree master 
	  - $ git ls-tree master assets/
	  - $ git ls-tree some_branch someFolder/

<br/>


