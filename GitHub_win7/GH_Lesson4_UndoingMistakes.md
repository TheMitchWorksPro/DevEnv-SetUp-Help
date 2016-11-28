
# Undoing Stuff on Git - Fixing Mistakes
<br/>

Source video: https://www.youtube.com/watch?v=vBLjB7PZoK0#t=3.375194

----
Notes taken from video - not all of these commands have been tested yet.
<br/>
<br/>

Edited file in local directory, saved file, did not add/commit on GIT yet - how to fix it?
- \$ git checkout -- myfile.txt
- \$ git checkout -- myDirectory
  - the "--" is current branch (in this case Master), and file we want is specified next
  - this one command checks out the file from repository and replaces working directory file with it
  - works on directories too as shown in above syntax
<br/>

File was staged (added to be committed) but now we want to edit it again:
- \$ git reset HEAD file.txt
  - do git status and it will tell us this syntax
  - this will unstage file.txt and reset the head 
  - this step undoes an add file operation so we can edit more and re-stage it
<br/>

- \$ git reset
  - will reset everything and let us add and commit again (which is often simpler)
<br/>

- \$ git commit --ammend -m "my comment"
- \$ git commit --ammend
  - w/ comment - this ammends the comment on last commit as well as adding new changes to it
  - if nothing staged (from previous add operations) - syntax above can change just the commit message
  - w/o -m: just adds new changes to last commit
  - can only affect last commit (most recent one) before we push
<br/>

- \$ git diff -- staged
  - shows difference between what is staged and prior edit
  - can show what changed with previous action so you can check it before committing it to finalize the reversion change
  

Example of editing previously committed content (1 file at a time):  
- \$ git checkout 6afab5e706a5327ca41336da1946759677eedb9f -- GitHub_Lesson4_UndoingMistakes.txt
  - this would checkout above mentioned file for editing from commit identified by hash ID
  - it should effectively revert file to this earlier version so we can edit, add, commit, as new version
  - video indicates first 10 characters of Hash is sufficient (don't need to copy whole thing as I did)
<br/>

Example of reversing all changes made by a previous commit:  
- \$ git revert 6afab5e706a5327ca41336da1946759677eedb9f 
  - this should reverse all changes and commit the results
  - you will be prompted to enter the commit message (default text editor should pop up like during "git commit")
  - save and close your message and process will complete
  - this works for simple changes
  - can enable a switch (-n) so it stages changes but does not commit them - the you can add/commit manually)
    - help file says this is particularly useful when reverting more than one change in a row 
<br/>

Useful informational command:  what does head point to?
- \$ cat .git/head
  - this returns a reference path like this:  ref: refs/heads/master
  - use cat .git/<ref path> to get SHA ID of commit head points to as in:
    - cat .git/refs/heads/master

## Soft Reset
- Important! Before using this, copy recent history from log into a new document.
  - once reset is performed, you cannot find the items in the log that you are "re-winding" over
<br/>

- \$ git reset --soft <SHA ID for commit to reset back to>
  - Example:  \$ git reset --soft 6afab5e706a5327ca41336da1946759677eedb9f
  - What this does:  
    - Head pointer moved to new location
	- if location is 3 commits back, then the two most recent will be lost when we add / commit current working
	- is like recording current work over some of the commits in the history log, but no content is actually changed
	- working directory is unaffected
	- staged commits (if any) are unaffected
	- is "least destrictive" commit

## Mixed Reset
- Important! Before using this, copy recent history from log into a new document.
  - once reset is performed, you cannot find the items in the log that you are "re-winding" over
<br/>

- \$ git reset --mixed <SHA ID for commit to reset back to>
  - Example:  \$ git reset --mixed 6afab5e706a5327ca41336da1946759677eedb9f
  - What this does:  
    - Head pointer moved to new location
	- if location is 3 commits back, then the two most recent will be lost when we add / commit current working
	- is like recording current work over some of the commits in the history log, but no content is actually changed
	- working directory is unaffected
	- How this is different from Soft:  
	  - staged commits are reset  
	  - our work is still in workin directory but is no longer staged to be committed
	  - "almost as safe as soft commit" - changes to content still there but now need to be restaged and committed

## Hard Reset
- Important! Before using this, copy recent history from log into a new document.
  - once reset is performed, you cannot find the items in the log that you are "re-winding" over
<br/>

- \$ git reset --hard <SHA ID for commit to reset back to>
  - Example:  \$ git reset --hard 6afab5e706a5327ca41336da1946759677eedb9f
  - What this does:  
    - Head pointer moved to new location
	- if location is 3 commits back, then the two most recent will be lost when we add / commit current working
	- is like recording current work over some of the commits in the history log, but no content is actually changed
	- working directory changes are thrown out
	- How this is different from Soft / Mixed:  
	  - staged commits are reset  
	  - changes to content thrown out - working directory now "matches repo" (matches point from log of reset)
	  - "most destructive" (changes to working directory are lost)
	    - Note:  "lost" ... but not entirely 
		  - if we preserved the history from the log before the change, for limited time, can still access it
		  - provided not garbage collected, can reset again with SHA-IDs from our copy of the lost history
		  - this can effectively get back the "working content we lost" provided that content was committed 
	
Note:  last left off in video:  ?



