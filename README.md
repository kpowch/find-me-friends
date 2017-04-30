# Find Me Friends
The app for meeting new people and making lifelong friends. Have you ever wanted to try felting but can't convince your friends to craft with you? Or do you not have any friends? **Find Me Friends** is the app for you! Sign up today to start connecting with friends in your neighbourhood to felt with you!

## Why use Find Me Friends?

We provide a platform for you to connect with people in your community who enjoy doing the same activties or are interested in trying new things! Consider us as the ice breaker, the mutual friend to connect you with someone awesome on an inviting and more personal level!

## How it Works

Find amazing friends with similar interests and set a time and place to meet up! It's that simple!

## Tech Stack
* **React**
* **Rails**
* **Postgres**
* **SASS**
* **Testing**
* **Deployed on Heroku**

## Styleguide
* ES6
* Rails
    - No brackets
* Class Names
    - Preference for longer names
    - Language specific styles; camelCase, snake_case, etc
* Thorough commenting
* Git/Github
    - Git/Github Pull Requests
    - Future tense commenting
    - Detailed comments
    - Feature specific naming for branches
        - *Feature/branch-name-obj*
        - *Testing/branch-name-object*
* Consistency
* **NO CODING ON MASTER**
  - Must face *shame* if so.
* Trello & Slack for communication



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

## Getting Started

```
nvm install node                # download and install latest stable Node
nvm alias default node          # make it default version
nvm list                        # check

brew install yarn               # you can use other installer if desired

brew install imagemagick        # required for image uploader

rvm install 2.3.1               # download and install latest stable Ruby (update to exact version)
rvm use 2.3.1 --default         # use it and make it default
rvm list                        # check

gem install rails               # download and install latest stable Rails
gem install foreman             # download and install Foreman
bundle && yarn
```

### To Run the Server

`foreman start -f Procfile.dev`

This is based off a [react_on_rails gem tutorial](https://github.com/shakacode/react_on_rails/blob/master/docs/tutorial.md). Make sure you have all the dependencies installed.

To get the app running: `foreman start -f Procfile.dev`
then visit: `http://localhost:3000/`

### Postgres Table Initializer

To start postgres:
`brew services start postgresql`

Then to start psql:
`psql -d postgres`

To make a new role and password:

```
postgres=# CREATE ROLE friend WITH LOGIN password 'lighthouse';
CREATE ROLE
postgres=# CREATE DATABASE find_me_friends OWNER friend;
CREATE DATABASE
```

`\q to quit psql`

Then run the migrations:
`bin/rails db:migrate`

If at any time you want to stop postgres:
`brew services stop postgresql`

Once you have the database, you can get to the table using:
`psql find_me_friends`

If you need to change something with the migrations/seeds and you need to drop the table, follow these steps:
1. Make the migrations: `bin/rails g migration <migration name>`
2. Drop the table: `bin/rails db:drop`
3. Create the database again: `psql -d postgres` then `create database find_me_friends owner friend;` (same as above)
4. Migrate the tables: `bin/rails db:migrate`
4. Seed the database: `bin/rails db:seed`

# Resources
[Shakacode React on Rails boilerplate](https://github.com/shakacode/react_on_rails)

[Real-Time Rails: Implementing WebSockets in Rails 5 with Action Cable](https://blog.heroku.com/real_time_rails_implementing_websockets_in_rails_5_with_action_cable)
