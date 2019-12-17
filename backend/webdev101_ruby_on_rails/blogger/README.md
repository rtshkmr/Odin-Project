# Ruby on Rails Project

Doing [This Odin Project task](https://www.theodinproject.com/courses/web-development-101/lessons/ruby-on-rails?ref=lnav#assignment)

- [see this tutorial for detailed info, explanations and steps](http://tutorials.jumpstartlab.com/projects/blogger.html)

**_Contents_**

- [Ruby on Rails Project](#ruby-on-rails-project)
- [Actual README](#actual-readme)
- [My Own Notes](#my-own-notes)
  - [Expected Basics Covered](#expected-basics-covered)
  - [Basic Read Features](#basic-read-features)
    - [Steps:](#steps)
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
      - [11. Adding Navigation to the Index](#11-adding-navigation-to-the-index)
      - [12. Creating SHOW Action](#12-creating-show-action)
      - [13. Styling your Templates](#13-styling-your-templates)
  - [Additional Create Features](#additional-create-features)
    - [Form Based Workflow:](#form-based-workflow)
      - [1. Adding a form](#1-adding-a-form)
      - [2. the Create Action](#2-the-create-action)
      - [3. Deleting Articles](#3-deleting-articles)
      - [4. Creating and Edit Action &amp; View: an Edit Workflow](#4-creating-and-edit-action-amp-view-an-edit-workflow)
      - [5. Adding a flash, as a status message for Update, Create and Destory actions](#5-adding-a-flash-as-a-status-message-for-update-create-and-destory-actions)
      - [6. Setting Root directory to some route](#6-setting-root-directory-to-some-route)
  - [More Important Takeaways &amp; Reminders](#more-important-takeaways-amp-reminders)

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

## Basic **Read** Features

### Steps:



#### 1. Creating new rails application

#### 2. Configuring the Database in `database.yml`

#### 3. Starting the Server, to check things are in order

#### 4. Creating the Article Model

- this generates:
  - a database migration to create the `articles` table
  - file that holds the model code
  - a fixtures file `.yml` to assist us in unit testing

#### 5. Working w the database

- migration files used to modify database, generatlly database agnostic
  - write your migrations once, and run them amongst almost any database
  - change the `change` method in the migration file
    - the variable `t` is referring to the article table created automatically in the db
  - running the migration via `bin/rake db:migrate`
- every table created with a migration will automatically have an `id` column that serves as **_the primary key_**

#### 6. working with a model in the console

- cli console to interact w the webapp
- can do bulk modifications, searches and other data operations

#### 7. Setting up the Router

- As part of MVC model, we touched on _Model_, now we need _Controller_ and _View_
- HTTP requests handled by **Router**. Decides what resources the browser is trying to interact w

  - Dissects the _address_ that the HTTP request is being made to
  - other HTTP parameters like _GET_ and _PUT_

- router config file: `config/routes.rb`

  - add resource attributes here that allows the router to follow the **RESTful model of web interaction**

  - Now, router knows how to handle requests about the model object, it needs a place to actually send those requests to: **the Controller**

#### 8. Creating the Object's Controller

- use another rails generator : `bin/rails generate controller articles`

- run `$ bin/rake routes`

#### 9. Defining the Index Action

- The `object_controller.rb` has methods for actions to be done.
  - Use Instance Variable syntax for the Methods to create **_Instance level variables_** that can be accessed by both the _controller_ and the _view_ so that other variables outside the `index` method and within the same object can access it

#### 10. Creating the template

- app will search for a view template in `app/views/articles/` in which it shall search for a `.erb` template file
- template naming:

  - `.html.erb`: the HTML clarifies that this view is for generating HTML, if creating things like RSS feeds, then we'd create something like `.xml.erb`

- erb clauses:

  - `<%` : the result of the code will be hidden
  - `<=%`: the result of the ruby code will be output in place of the clause
  - note that you can add in html element tags into the erb tags

  (?) how come we don't need to put doctype tag at the top of the .html.erb file?

#### 11. Adding Navigation to the Index

- Ref to Routing Table to see route names that will be used for links
- _"route helper"_ is used to specify where the link will point to. route helper looks like this:
  - `article_path(id)`
- in the template file, we add the links, using a link helper see [index template file](/backend/webdev101_ruby_on_rails/blogger/app/views/articles/index.html.erb)
  - can add new article creation links at the bottom, similarly. See where you have to point to based on the routing table, then create link using link helper.
- now, there's a link but there's no `show` action (creating a show method of the controller)

#### 12. Creating SHOW Action

- what do we want to do when the user clicks an article title? Find the article, then display a page with its title and body. We’ll use the number on the end of the URL to find the article in the database.

#### 13. Styling your Templates

- place css sheets, appropriately named at `app/assets/stylesheets/`

## Additional **Create** Features

Creating an HTML form to submit the article, then backend processing to get it into the database

### Form Based Workflow:

#### 1. Adding a form

- a template for new articles is needed
- use Rails helper method `form_for` to make the form
- Setting up for **Reflection**:
  - you have to create the object that the instance variable will pass to `form_for` method. To do this, instantiate in the
    `new` method itself, where you assign the `@article` instance variable to a new Article object `Article.new` to prevent the variable from holding `nil` as a variable and therefore throwing error.

#### 2. the **Create** Action

- have to define a create method within the `ArticlesController` class, then direct the view to some template.
  - we don't have to create a new view template because we already have `show` and the template for that. Here, we just need to
    use the show template
- Before giving a view, we **_Process the Data_**.

  - Momentarily use `fail` method within the `create` method to halt the request so you can examine request parameters in the **runtime error**. Then, you'd know how to analyse the form parameters and access the parameters you require.
  - **Pull Out Form Data** data via the `params` method and assign to instance variables
  - rmb to put in a redirect action. e.g.:
    - `redirect_to article_path(@article)`
    - we can't blindly save params sent into us via the params hash because of **security reasons**, so you have to use **_Strong Parameters_**:
      - use `require` and `permit` to declare which attributes to accept (create a helper method for this in the dir for helpers: `app/helpers/articles_helper.rb`)
      - import the helper module into the `ArticlesController` class, after which you can use the `article_params` which you have written in the helper, that uses strong params

#### 3. Deleting Articles

- add delete links to the index. In the tutorial, we add it to the show template:

- using `link_to` helper, create a link. The path for link is taken from routing table, where we look for the `destroy` action

  - link will look something like this: `<%= link_to "delete", article_path(@article) %>`

- have to take note of the VERB used. **HTML forms only support `GET` and `POST`**. So to delete, you need to add this to the template:
  - `<%= link_to "delete", article_path(@article), method: :delete %>`
  - this is some Rails hack where the `DELETE` verb is faked by using some JavaScript tricks and triggerring the deletion.
- HTTP verb `DELETE` uses the Rails method `DESTROY` and for this, we need a `destroy` method within our `ArticlesController` class
  - rmb after the action, you have to describe where to redirect to!
- rmb to ask for a deletion confirmation by adding a method call to `confirm`:

  - `data: {confirm: "Really delete the article?"}`
  - confirm will make a dialogue box pop up

#### 4. Creating and Edit Action & View: an **Edit** Workflow

- add the edit link in `show.html.erb` first
  - **Trigger** the `edit_article`route and pass in the `@article` object
- define the `edit` **action** in the controller
- create template form for editing, use **_partial templates_** for this.
- implement the `update` method in controller.

  - you can expect it too look very similar to create
  - the `update` method takes in the hash of form data, changes the values in the object to match the values submitted with the form and automatically saves the changes (that's why you don't need to use the `save` method)

#### 5. Adding a `flash`, as a status message for Update, Create and Destory actions

- Adding a flash message is just a one-line insertion into the controller method, followed by invoking a view.

  - could have added to our show template itself, but here, we want to use view many times, so just create a **layout**
  -

- add a `flash` for the update action, by adding a notice to the `app/views/layouts/application.html.erb` file

- 

#### 6. Setting Root directory to some route
- in `config/routes.rb`, make the root show the articles index page by adding:
  - `root to: 'articles#index'`



## More Important Takeaways & Reminders

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

6. The `params` method within the controller is a godsend. Returns the hash of the **request parameters**. See the various keys

7. In the routing table, names "trickle down" so if one of the rows have no routes, then just loop up to the row above it...

8. The controller, being a middleman in the MVC framework, should know as little as possible to get its job done.

   - consider creating an instance and passing it a hash of attributes instead of one-by-one declaring instance attributes in the `create method`
   - you can't blindly save params sent into us via the params hash because of **security reasons**, so you have to use **_Strong Parameters_**:
     - use `require` and `permit` to declare which attributes to accept (create a helper method for this in the dir for helpers: `app/helpers/articles_helper.rb`)
     - import the helper module into the `ArticlesController` class, after which you can use the `article_params` which you have written in the helper, that uses strong params

9. Abstracting template files as partials!

- partial file names always start with underscore `_form.html.erb`
- render partials in other template files like so:
  - `<%= render partial: 'form' %>`

10. Layouts wrap multiple view templates in our application. Layouts can be specific to each controller , but usually we just use one layout that wraps every view template in the application
