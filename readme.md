== Welcome to CC Organized

This is an attempt to model the organization of CC.  The main focus is on the technology side of things.  But pretty much all of the organization is relevant to the technology side of things.

=== Building a local copy of the application

The applications RubyGem dependencies are managed with Bundler so after cloning the repository first run:

    bundle install --binstubs

This App uses postgres so that it can be deployed onto Heroku.

You can install postgresql with the Homebrew package manager then follow the instructions for initializing the database and automatically starting postgresql:

    brew install postgresql

To get started with the existing database.yml you need to make a user with database creation privileges for postgresql.

    createuser -d -P -S -R cc_organized

The command will ask for the new users password which should be 'cc_organized'.

If you are using a binary package install of postgresql the path to the `createuser` command may instead look like this:

    sudo -u postgres /Library/PostgreSQL/9.1/bin/createuser -d -P -S -R cc_organized

After creating the `cc_organized` user make and migrate the application databases:

    bin/rake db:create
    bin/rake db:migrate

Create the app:

    bin/heroku create --stack cedar

Push the app to heroku

    git push heroku master

The push doesn't migrate the db for some reason

    bin/heroku run rake db:migrate
    bin/heroku restart