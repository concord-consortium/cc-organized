== Welcome to CC Organized

This is an attempt to model the organization of CC.  The main focus is on the technology side of things.  But pretty much all of the organization is relevant to the technology side of things.

This App uses postgres so that it can be deployed onto Heroku.  To get started with the current database.yml you need to make a user with database creation priveledges for postgres.  The following command works for me:
sudo -u postgres /Library/PostgreSQL/9.1/bin/createuser -d -P -S -R cc_organized

The command will ask for the new users password first which should be 'cc_organized'.
Then it will ask for the postgres user's password in order to create this user. 

After that is complete you'll need to make and migrate the databases:
rake db:create
rake db:migrate

If you want to deploy to Heroku you need the heroku gem installed:
gem install heroku

Create the app:
heroku create --stack cedar

Push the app to heroku
git push heroku master

The push doesn't migrate the db for some reason
heroku run rake db:migrate
heroku restart