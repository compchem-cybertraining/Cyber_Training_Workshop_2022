---
title: "2. Revision of Python and best practices. Coding Molecular Dynamics"
date: June 14, 2021, 2:00 pm - 5:00 pm EDT

---


<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=3f9a7e29-cacc-4fe2-ba4a-ad47016afb73&
autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="900" width="800"
 style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>


<a name="toc"></a>
# Table of Content
1. [Brief Python overview](#python)
2. [Best practices](#best_practices)
3. [Working on collaborative projects with Git and GitHub](#github2)
4. [Constructing MD integrators](#md)


<a name="python"></a>
## 1. Python introduction
[Back to TOC](#toc)

  My best referece [is this site](https://www.tutorialspoint.com/python/index.htm)

  Copy the example from

    Instructors_material/Python/Python_overview.ipynb

  or from:

     https://github.com/compchem-cybertraining/Tutorials_Python


<a name="best_practices"></a>
## 2. Best practices

  * PEP standards, readability and modularity of the codes
  * testing (covered above)
  * GitHub (this section)

  This section can also be found [here](https://akimovlab.github.io/soft_and_tuts/5.6-GIT.html)

  I also recommend [this reference](https://education.github.com/git-cheat-sheet-education.pdf)
 
  And a [more complete documentation](https://git-scm.com/docs)

Below I will summarize the list of most important Git commands. Note that the names in the UPPER CASE have to 
be substituted with the actual names specific to your work. 


### 2.1. Working locally (development and info)

#### 2.1.1. **Initializing an empty repo** 
To create a brand-new Git repo with nothig else

    git init


#### 2.1.2. **The status of your repo** 
To shows the current state of your project. This will show which files/directories are in unstaged/staged/commited/uncommited
as well as the branch on which you are currently on

    git status


#### 2.1.3. **The history of commits** 
To show the history of all commits and the development tree, highlights the sections

    git log

A better version of this 

    git log --graph --pretty=format:'%C(magenta)%h%C(blue)%d%Creset %s %C(blue bold)- %an, %ar%Creset'

or

    git log --decorate


#### 2.1.4. **Diff** 
To show the changes of the present state made w.r.t. the latest commit

    git diff


#### 2.1.5. **Adding files and directories in the repo** 
To add the FILES-OR-DIRECTORIES to a so-called "staging" area (think of concert) - something you are working with at the moment.
The FILES-OR-DIRECTORIES are the names of the files or directories to add. You can use an asterisk to match multiple files

    git add FILES-OR-DIRECTORIES


#### 2.1.6. **Commiting** 
This will commit the files in the current "staging" area to the development history of the code - this way you save the most
valuable and recent state of the project. You can also think of this as making a snapshot of the history of your code.
The message should be informative and must describe clearly what changes have you made in the present version w.r.t. the older state of the code.

    git commit -m "Some-message"


### 2.2. Working with branches
#### 2.2.1. **Find out the current branch** 
To show the list of available branches and highlight the active branch

    git branch

or slightly more verbose

    git branch -rv


#### 2.2.2. **Creating a new branch** 
To create a new branch called BRANCH-NAME. The present repository in its present state will be copied into the new branch.

    git branch BRANCH-NAME


#### 2.2.3. **Deleting a branch** 
To delete a branch called BRANCH-NAME.

    git branch -d BRANCH-NAME


### 2.2.4. **Switching into a new branch** 
To switch into the existing BRANCH-NAME branch. This will bring up all the files at the stage of the last commit on that branch.
Be careful - this may override your existing files, so you'd need to commit all the changes you have made to those files,
otherwise all those changes will be lost.
Also - this is a way to "recover" accidentally deleted files or "roll back" to the latest commited stage.

    git checkout BRANCH-NAME


#### 2.2.5. **Merging** 
To merge the branch called BRANCH-NAME into your currently active branch

    git merge BRANCH-NAME



### 2.2. Working with remotes

#### 2.2.1. **cloning** 
To clone another repository located at the REPOSITORY_URL (remote = e.g. GitHub repo) to your current repository (local computer)

    git clone REPOSITORY_URL.git


#### 2.2.2. **Info on the remotes** 
To show the list of available remotes

    git remote -v


#### 2.2.3. **Adding a remote** 
Add a "remote" you can pull from and push to. The REMOTE-NAME will be a short name of the remote,
whereas REMOTE-URL is the actual link to the remote repository (ending with .git). 

There are couple standard names of the remotes:

 * `origin` - this is your own GitHub repository which mirrors your local repo

 * `upstream` - this is the GitHub repository which you may not have rights to, but the one
     where you are planning to contribute to


    git remote add REMOTE-NAME REMOTE-URL

#### 2.2.4. **Renaming a remote** 
To rename the name of the already existing remote

    git remote rename OLD-REMOTE-NAME NEW-REMOTE-NAME


#### 2.2.5. **Removing a remote** 
To remove the remote (a link to the remote repository, known to your git package) named REMOTE-NAME. 
This will remote the name of the remote from your list of available remotes. 
This doesn't change the remote repository, of course

    git remote rm REMOTE-NAME


#### 2.2.6. **Pulling** 
To get the latest version of the REMOTE-BRANCH branch on the remote repository REMOTE-NAME and merge it into you presently chosen branch.

    git pull REMOTE-NAME REMOTE-BRANCH


#### 2.2.7. **Pushing**

To update the branch REMOTE-BRANCH of a remote reporisotry you have (write) access to called REMOTE-NAME 
with the latests updates (commits) on the branch of a local repository you are currently in

    git push REMOTE-NAME REMOTE-BRANCH



### 2.3. Using GIT - practical exercies

    git clone https://github.com/<your-account>/Cyber_Training_Workshop_2021.git
    git remote add origin https://github.com/<your-account>/Cyber_Training_Workshop_2021.git
    cd course_work
    mkdir my_name
    git add my_name
    git commit -m "Added my stuff"
    git push origin main
     

A typical session is:

    git init
    git status
    git add my_code.py
    git status
    git commit -m "Added my new code"
    git status
    git push origin master

A session with branching and external repo

    git clone https://github.com/Quantum-Dynamics-Hub/libra-code.git
    git branch my_new_feature
    git branch    
    git add my_code.py
    git commit -m "fixed a bug"
    git remote add origin https://github.com/alexvakimov/libra-code.git
    git push origin my_new_feature

A session with merging and upstream update

    git remote add origin https://github.com/alexvakimov/libra-code.git
    git remote add upstream https://github.com/Quantum-Dynamics-Hub/libra-code.git
    git pull upstream master   
    git branch my_new_feature
    git branch    
    git add my_code.py
    git commit -m "fixed a bug"
    git status
    git checkout master 
    git merge my_new_feature
    git push origin master


<a name="github2"></a>
## 3. Working on collaborative projects with Git and GitHub
[Back to TOC](#toc)

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=0d1facf1-f10c-4372-9487-ad49016debe4&
autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="900" width="800" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>


<a name="md"></a>
## 4. Molecular Dynamics
[Back to TOC](#toc)

### [Presentation](../files/episode_1/Akimov-MD.pdf)

