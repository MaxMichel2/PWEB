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
* Open any browser and type: **localhost:8000/exchange/home**
* Congratulations, the website is up and running! Feel free to play around.

## Update database from django shell

* Open a terminal in the folder that contains **manage.py**
* Run the following command:
	* **python manage.py shell**
* Once in the shell, type **from exchange.models import**
* You can now access and modify any element within the database

**Examples**

* Adding a new entry to a specific table:
	* Adding a new County: **newCountry = Country(CountryName="A Country", ECTSConversion=1, Countinent="AS")**
	* **newCountry.save()**
	* Note that you need to fill in all the fields that are required when creating a new entry (in the models.py file, any attribute that has a default value isn't required to be entered)

* Updating an existing entry:
	* **updatedEntry = Country.objects.get(ID=123)** (You need to know what entry you want to modify, you can find this out however you want using the ID, some of its attributes or any other method)
	* **updatedEntry.ECTSConversion=1.5**
	* **updatedEntry.save()**