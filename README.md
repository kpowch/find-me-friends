# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Getting Started
This is based off a [react_on_rails gem tutorial](https://github.com/shakacode/react_on_rails/blob/master/docs/tutorial.md). Make sure you have all the dependencies installed.

To get the app running: `foreman start -f Procfile.dev`
then visit: `http://localhost:3000/`

# Postgresql

To start postgres:
`brew services start postgresql`

To stop postgres:
`brew services stop postgresql`

Then to start psql:
`psql -d postgres`

To make a new role and password:

```
postgres=# CREATE ROLE friend WITH LOGIN password 'lighthouse';
CREATE ROLE
postgres=# CREATE DATABASE find_me_friends OWNER friend;
CREATE DATABASE
```
`\q` to quit psql
