# Lessons in creating and working with branches

- This topic is documented from watching online videos
- Process written up on assumption user is still working individually
- It does not include help for complexities that will arise when you share your project in collaboration with others

----

## Command List for Working With Branching

- $ git branch "name-of-branch"
  - creates a new branch (empty branch to work in)
  - example:  git branch devWork
  - branches can be created "from something" - this is covered in more detail later in this document
<br/>

- $ git checkout "name-of-branch" 
  - switch to branch
  - before checkout "git status" would show we are on master
  - after checkout "git status" would show we are on the new branch
  - example:  git checkout devWork
<br/>

- $ git branch -d "name-of-branch"
  - must switch to other branch (like master) first before deleting
  - will give warnings like "this branch is not merged sure you want to do this?"
  - to finalize this action:  git branch -D "name-of-branch"
    - note:  only difference is D instead of d
<br/>

- $ git checkout -b "name-of-branch" 
  - this checkout can create the branch if it does not exist
<br/>
 
Assume we created dev branch:
<br/>

- $ git branch dev
  - this creates dev branch
- $ git checkout dev
  - this switches to dev branch 
<br/>

During editing of the new Branch:
 - Git Add and Commit commands allow system to track changes for push or merge
 - Push is not used unless you want to share the branch with your online or server based project
 - For simple project you are working on by yourself - just use:
   - - $ git add --all (or other variants)
   - - $ git commit
   - Then you are ready to merge
<br/>

Now we are in dev -- make changes here.  To merge back, first test what it will look like by:
- merging any changes to Master since we split off into dev
- if results are good, then we merge dev into master
- if master has not changed, first step will tell us that all is up-to-date:
<br/>

- $ git merge master
<br/>
 
Check results and switch to master to perform the merge there (it merges too current branch)
<br/>

- $ git checkout master
- $ git merge dev
<br/>

Messages will tell us this process is a "fast-forward" - and changes will merge
<br/>

If we are done with dev branch, now we can use above commands to delete it:
<br/>

- $ git branch -d dev
- $ git branch -D dev 
<br/>

Notes:  help documentation indicated that -d let you test delete while -D made it happen for real
- During my testing, these two commands worked the synonymously - both delete, neither tests
- Do not know if this is a Windows 7 behavior, something unique on my system, or what you should always expect
<br/>

----
## From Video:  Some of these commands are untested
<br/>

- $ git fetch
  - pulls down all branches from remote repository
  - you cannot switch to them; you can only merge them into your working branch
  - if you use this, next step is:  $ git merge  
<br/>
 
- $ git pull <remote> <branch>
  - fetches and merges, but conflicts will need resolution
  - example:  - $ git pull origin master
<br/>

- $ git push <remote> <branch>
  - pushes changes back up to server specifying repository and branch
  - example:  - $ git push origin master
<br/>
  
- $ git branch <branch-to-be-created> <source of content for this branch>
  - choices for second argument include:  HEAD, a specific commit, or a branch from the remote repo like "origin/master"
  - example:  $ git branch devWork origin/devWork
    - this example pulls down a copy of the devWork branch from our repo into a new local branch of the same name-of-branch  
    - use git branch -r to get exact name/syntax of branch to pull down  
Note:  You cannot check out a remote branch, you can only copy it down locally to work on it and then push back up.	
	