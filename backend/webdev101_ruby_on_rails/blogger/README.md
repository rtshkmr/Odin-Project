# Ruby on Rails Project

Doing [This Odin Project task](https://www.theodinproject.com/courses/web-development-101/lessons/ruby-on-rails?ref=lnav#assignment)

- [see this tutorial for detailed info, explanations and steps](http://tutorials.jumpstartlab.com/projects/blogger.html)

**_Contents_**

- [Ruby on Rails Project](#ruby-on-rails-project)
- [Actual README](#actual-readme)
- [My Own Notes](#my-own-notes)
  - [Expected Basics Covered](#expected-basics-covered)
  - [Steps](#steps)
    - [1. Creating new rails application](#1-creating-new-rails-application)
    - [2. Configuring the Database in database.yml](#2-configuring-the-database-in-databaseyml)
    - [3. Starting the Server, to check things are in order](#3-starting-the-server-to-check-things-are-in-order)
    - [4. Creating the Article Model](#4-creating-the-article-model)
    - [5. Working w the database](#5-working-w-the-database)
    - [6. working with a model in the console](#6-working-with-a-model-in-the-console)
    - [7. Setting up the Router](#7-setting-up-the-router)
    - [8. Creating the Object's Controller](#8-creating-the-objects-controller)
    - [9. Defining the Index Action](#9-defining-the-index-action)
    - [10. Creating the template](#10-creating-the-template)
  - [Takeaways](#takeaways)

# Actual README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

# My Own Notes

## Expected Basics Covered

1. MVC
2. Data Structures and Relationships
3. Routing
4. Migrations
5. Views with forms, partials and helpers
6. RESTful design
7. Adding gems for extra features

## Steps

### 1. Creating new rails application

### 2. Configuring the Database in `database.yml`

### 3. Starting the Server, to check things are in order

### 4. Creating the Article Model

- this generates:
  - a database migration to create the `articles` table
  - file that holds the model code
  - a fixtures file `.yml` to assist us in unit testing

### 5. Working w the database

- migration files used to modify database, generatlly database agnostic
  - write your migrations once, and run them amongst almost any database
  - change the `change` method in the migration file
    - the variable `t` is referring to the article table created automatically in the db
  - running the migration via `bin/rake db:migrate`
- every table created with a migration will automatically have an `id` column that serves as **_the primary key_**

### 6. working with a model in the console

- cli console to interact w the webapp
- can do bulk modifications, searches and other data operations

### 7. Setting up the Router

- As part of MVC model, we touched on _Model_, now we need _Controller_ and _View_
- HTTP requests handled by **Router**. Decides what resources the browser is trying to interact w

  - Dissects the _address_ that the HTTP request is being made to
  - other HTTP parameters like _GET_ and _PUT_

- router config file: `config/routes.rb`

  - add resource attributes here that allows the router to follow the **RESTful model of web interaction**

  - Now, router knows how to handle requests about the model object, it needs a place to actually send those requests to: **the Controller**

### 8. Creating the Object's Controller

- use another rails generator : `bin/rails generate controller articles`

- run `$ bin/rake routes`

### 9. Defining the Index Action

- The `object_controller.rb` has methods for actions to be done.
  - Use Instance Variable syntax for the Methods to create **_Instance level variables_** that can be accessed by both the _controller_ and the _view_ so that other variables outside the `index` method and within the same object can access it

### 10. Creating the template

- app will search for a view template in `app/views/articles/` in which it shall search for a `.erb` template file
- template naming:

  - `.html.erb`: the HTML clarifies that this view is for generating HTML, if creating things like RSS feeds, then we'd create something like `.xml.erb`

- erb clauses:

  - `<%` : the result of the code will be hidden
  - `<=%`: the result of the ruby code will be output in place of the clause

  (?) how come we don't need to put doctype tag at the top of the .html.erb file?

## Takeaways

1. `rails` vs `bin/rails`. the latter is used to run scripts like the `generate` script

2. migration files:

   - `db/migrate/(some_time_stamp)_create_articles.rb`, the timestamp part is useful for organisation
   - the migration file only has one method called `change` where we write out how to do the `up` migration (the change), the undo methods are
     handled by Rails!
   - dbs have type `text` or `varchar` for large text fields. **database adapter** takes care of figuring out the best type, depending on the db in the config

3. `rake` is for running maintenance-like functions on your application (working with the DB, executing unit tests, deploying to a server, etc).

4. There's a technique called **\*reflection** whereby Rails queries the db, looks at the articles table, and assumes whatever columns that table has that should be the attributes for the model.

5. RESTful model of Web interaction: (REpresentational State Transfer)
   - 7 Core actions of Rails' REST implementation
