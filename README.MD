Hello, there
===============
I present to your attention the website of the Kazan State University of Architecture and civil Engineering in the field of Information systems and technologies.

Steps to launch on Linux
------------------------

# postgreSQL installing

    $ psql --version 
 find out the Postgres version, if there is one
 If you do not have postgreSQL installed, then next step, Else step 5
    
    $ get-apt update
    
updating the package tree


    $ sudo apt-get install postgresql postgresql-contrib
    $ sudo -i -u postgres 
    
changing the user

    $ createdb another_db
    
create database for app

    $ psql 
    
***for launching psql***

    \l 
***show databases in server***

    \c another_db 
***connecting to the database***

    \d 
***display tables, should be 0***

    \q 
***quit from psql***
    
    exit 
    
***exit from postgres and return on Ur user***


# cloning and launching

    $ git clone https://github.com/CptWasp/kgasuisit.git
  
***enjoy in intellijIDEA***


Steps to launch on Windows
--------------------------

[PostgreSQL](https://www.postgresql.org/download/windows/)
[Project in zip](https://github.com/CptWasp/kgasuisit/archive/main.zip)


