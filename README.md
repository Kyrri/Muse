# Muse
FYPD - Museum Project Muse repo

**DO NOT commit the folder 'node_modules' if you make any changes. This folder is created when you install package dependencies.
To make sure you don't, before a commit, type 'git reset userApp/node_modules' and 'git reset adminApp/node_modules' (the path to the folder node_modules, that is) 
in your terminal from your source folder where the .git file is (probably called Muse)
*** /...../node_modules/ is added to gitignore, git will not track this file

To install/use:

1) Download and install Node.js. To do this on Mac, follow this guide up until, and including "Installing NPM".
  You'll end up with Node.js, and NPM (Node Package Manager) installed on your computer. All these commands are run
  from your terminal, which is an app you can find in Utilities.
  http://dandean.com/nodejs-npm-express-osx/

2) Navigate in your terminal to Muse/userApp, and from here type 'npm install'. This will install package dependencies defined
  in package.json . Do this again in the Muse/adminApp directory. 

3) To run the server, type "node app.js" from the terminal in your Muse/userApp directory (if this fails, try "nodejs app.js") to run the user-based web App server, or in Muse/adminApp to run the admin website

4) To test server, in your browser, go to http://localhost:3000 for the user app or http://localhost:3333 for the admin site
