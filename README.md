# README

* Ruby version

3.2.2

* Database configuration

Database used is postgresql.

Create a `.env` file at the root of the folder and add your pg user (PGUSER) and password (PGPASSWORD) variables.

* Database creation

run `bin/rails db:create`

* Database seed

run `bin/rails c`

And in the console: `ImportArticlesFromJsonJob.perform_now('articles.json')`