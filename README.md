# README

* Ruby version

3.2.2

* Rails version

7.1.3

* Database configuration

Database used is postgresql.

Create a `.env` file at the root of the folder and add your pg user (PGUSER) and password (PGPASSWORD) variables.

* Database creation

run `bin/rails db:create db:migrate`

* Database seed

run `bin/rails console`

And in the console: `ImportArticlesFromJsonJob.perform_now('articles.json')`

* Launching the app locally

run `bin/rails server`
