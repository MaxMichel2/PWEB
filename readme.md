# PWEB - Astus International

## Add repository to VS Code

* Open a clean VS Code and type **Ctrl+Shift+P**
* Type "**git clone**" in the command window
* Type the following URL when prompted: **https://github.com/MaxMichel2/PWEB**
* Select a location on your computer to store the contents of the GitHub repository
* When prompted, open the repository that has been created

**All the files and folders contained in the GitHub repository should have been downloaded**

## Push changes to the repository

* Save your changes
* Type **Ctrl+Shift+G**
* Type a message describing the changes you've made
* Type **Ctrl+Enter**
* Click the bottom-left **Synchronize Changes** icon
* Click **Ok** if a prompt appears

The changes should be saved to the repository and you should be able to see them online

## How to run this website

* Install (if not already done) the following: Python 3, MySQL, VS Code (for practicality)
* Install the following python libraries: django, mysql, mysqlclient, django-cas, django-cas-ng, certifi, requests, sqlparse, python-cas, lxml, six, urllib3
* Create a folder on your computer and clone this repository (Download and copy everything contained in this repository)
   * If you followed the above instructions, you should already have this folder
* Open **MySQL Workbench** and create a root user with/without a password
* Open **Local instance MySQL Router** with the root user
* Create a new schema with the name you like (The name used in this code is: **pweb_international**)
* Set it as the default schema
* Edit the file **settings.py** in the folder **PWEB** with your specific database information
* Open a command prompt/terminal window in the folder containing **manage.py** and type: 
    * **python manage.py makemigrations**
    * **python manage.py migrate**
    * **python manage.py runserver**
* Open any browser and type: **localhost:8000/exchange/accueil**
* Congratulations, the website is up and running! Feel free to play around.

