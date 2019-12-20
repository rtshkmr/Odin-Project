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
  - [Commenting Features](#commenting-features)
    - [Steps:](#steps-1)
      - [1. Creating the Comment Model](#1-creating-the-comment-model)
      - [2. Setting up the Migration](#2-setting-up-the-migration)
      - [3. Understanding Relationships b/w elements of data](#3-understanding-relationships-bw-elements-of-data)
        - [Testing relationship via the console](#testing-relationship-via-the-console)
      - [4.Displaying Comments for an Article](#4displaying-comments-for-an-article)
      - [5. Creating a Web Interface for creating comments: Web-Based Comment Creation](#5-creating-a-web-interface-for-creating-comments-web-based-comment-creation)
        - [Comment Form Partial: embeding a form onto a view template and creating the partial form template](#comment-form-partial-embeding-a-form-onto-a-view-template-and-creating-the-partial-form-template)
        - [updating the ArticlesController for the comment](#updating-the-articlescontroller-for-the-comment)
        - [Improving the Partial Comment form template](#improving-the-partial-comment-form-template)
        - [Updating the Router to create the necessary paths](#updating-the-router-to-create-the-necessary-paths)
        - [Creating a CommentsController](#creating-a-commentscontroller)
        - [Writing the create method within CommentsController](#writing-the-create-method-within-commentscontroller)
        - [Adding Comments Count](#adding-comments-count)
        - [Adding Form Labels](#adding-form-labels)
        - [Adding Timestamp to comment display](#adding-timestamp-to-comment-display)
  - [Tagging Features](#tagging-features)
    - [Steps:](#steps-2)
      - [1. Understanding the Relationship: database modelling](#1-understanding-the-relationship-database-modelling)
        - [Options to model the database:](#options-to-model-the-database)
      - [2. Making Models: Tag and Tagging using Rails model generator](#2-making-models-tag-and-tagging-using-rails-model-generator)
      - [3. Expressing relationships b/w models by adding relationships to respective models/&lt;model&gt;.rb files](#3-expressing-relationships-bw-models-by-adding-relationships-to-respective-modelsltmodelgtrb-files)
      - [4. An Interface for Tagging Articles](#4-an-interface-for-tagging-articles)
      - [5. Adding Tags to Our Display](#5-adding-tags-to-our-display)
      - [6. Listing Articles by Tag](#6-listing-articles-by-tag)
  - [Using Gems](#using-gems)
    - [The paperclip library](#the-paperclip-library)
      - [1. Using the Gemfile to Setup a RubyGEm](#1-using-the-gemfile-to-setup-a-rubygem)
      - [2. Setting up The Database for Paperclip](#2-setting-up-the-database-for-paperclip)
      - [3. Add to the Article Model](#3-add-to-the-article-model)
      - [4. Modifying the Form Template](#4-modifying-the-form-template)
      - [5. Improving the Form (seems like latest gem version aldy does this automatically)](#5-improving-the-form-seems-like-latest-gem-version-aldy-does-this-automatically)
      - [6. Allowing Multiple Image Attachements [HELP I CAN'T DO THIS :(]](#6-allowing-multiple-image-attachements-help-i-cant-do-this)
      - [7. SASS examples](#7-sass-examples)
      - [8. Working with Layouts: how to manually set layouts](#8-working-with-layouts-how-to-manually-set-layouts)
  - [Implementing Authentication](#implementing-authentication)
    - [Steps:](#steps-3)
      - [1. Install by Adding to Gemfile](#1-install-by-adding-to-gemfile)
      - [2. Running the Generator (automates the model creation and data migration...)](#2-running-the-generator-automates-the-model-creation-and-data-migration)
      - [3. Creating a First Account](#3-creating-a-first-account)
      - [4. Logging In](#4-logging-in)
      - [5. Securing New Users](#5-securing-new-users)
  - [Heroku Deployment](#heroku-deployment)
    - [Steps:](#steps-4)
      - [1. Create Heroku Application](#1-create-heroku-application)
      - [2. Config App by changing Gemfile to prevent sqlite3](#2-config-app-by-changing-gemfile-to-prevent-sqlite3)
      - [3. Config Root Route](#3-config-root-route)
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
- rmb to enter the development environment by running
  - `bin/rails console` in the project's working directory

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

## Commenting Features

### Steps:

#### 1. Creating the Comment Model

- brainstorming what it will be:

  - what kind of data does it have?
  - where will it be attached to?
  - what other attributes will it have?
    - author name?
    - body?

- use generator to create the comment model, passing in the field you want in the db
  - important files to take note of:
    - `comment.rb`
    - migration file

#### 2. Setting up the Migration

- check the newly created migration file for the model that has been created, in this case the migration file would look something like this: `db/migrate/some-timestamp_create_comments.rb`
  - the fields added would be:
    - `:author_name`
    - `:body`
    - `:article`
- run the migration in the project's root dir: `bin/rake db:migrate`

#### 3. Understanding Relationships b/w elements of data

- Or in our case here, join together an article in the articles table with its comments in the comments table. We do this by using foreign keys.
- Foreign keys are a way of marking one-to-one and one-to-many relationships.

  - e.g. 0, 5 or 100 comments may exist for one article, but one article connects to that many comments

- Rails makes it simple to work with relationships. When we created the migration for comments we started with an `references` field named `article`. So this exemplies the convention for **_one-to-many_** relationships:

  - the objects on the "many" end should have a foreign key referencing the "one" object.
  - that foreign key should be titled with the name of the "one" object, then an underscore, then "id".
    here, one article has many comments, so each comment has a field named `article_id`

- this relationship is reflected in the respective model files `comment.rb` and `article.rb` files.
  - **_Ensure you have declared the one-side of the relationship!_** not everything will be autoadded

##### Testing relationship via the console

- test out comment creation and adding comment attribute values
- `create` vs `new` methods: if you use `new` then you have to explicitly `save` the change. `create` automatically does both
- rmb to reload the irb so that it doesn't lazily fetch things from the cache

#### 4.Displaying Comments for an Article

- figure out where you want to display it, go to that template and `render` a **partial** for a collection of comments (iterating thru a array that is comments)
- create the partial template

#### 5. Creating a Web Interface for creating comments: Web-Based Comment Creation

##### Comment Form Partial: embeding a form onto a view template and creating the partial form template

- we want to enter the comment directly onto the article page, instead of being redirected to another form view, so we **embed the new comment form onto the article show**

- insert the `render` into the correct view template.

  - this template will look for `comment/form` so,
  - create the subdir `comments` inside `app/views`

##### updating the ArticlesController for the comment

- we want to create a blank comment object within the `show` method for the reflection to happen (?)
- use `Comment.new` instead of `@article.comments.new`. If not, you'll have an extra comment created. That is due to the fact that `@article.comments.new` has added the new `Comment` to the in-memory collection for the `Article`. Don’t forget to change this back.
- **_The `Comment` object inside that `show` method has to be manually assigned with the `id` of the `Article`, thanks to Rails’ mass-assignment protection._**

##### Improving the Partial Comment form template

##### Updating the Router to create the necessary paths

- the `form_for` helper is trying to build the form and then submit it to `articles_comments_path` but for this path to exist, you have to provide the router this path, so config it at `config/routes.rb`

##### Creating a CommentsController

- use generator to generate controller:

  - `bin/rails generate controller comments`

##### Writing the create method within CommentsController

- instructions are similar to the `create` method in `articles_controller.rb`
  - replace `Article` object with `Comment` object
- **NB:** take note of how to assign the article id to our comment:

  ```ruby
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
  ```

##### Adding Comments Count

- just modify the comments header

##### Adding Form Labels

- change the forms' labels so it makes more contextual sense.
- update the partial template at `comments/_form.html.erb`

##### Adding Timestamp to comment display

- useful rails helper called `distance_of_time_in_words`
- add to `_comment.html.erb` the comment view partial

## Tagging Features

- tagging for organisation and navigation
- think: how to relate to the Article model?

### Steps:

#### 1. Understanding the Relationship: database modelling

- A tag must have a relationship to an article so they can be connected
- consider both models: tags and articles. they have a **_many-to-many relationship_**
- In SQL database, we would put the foreign key (`article_id`) inside the `tags` table
  - then, a Tag would "belong" to an Article.
  - but then a Tag can connect to many articles, not just one.
- **_SO, just `articles` and `tags` tables are not enough to model this relationship_**

##### Options to model the database:

1. having a **_"join table"_** called `articles_tags`

   - Article model would have a `has_and_belongs_to_many` r/s w Tags

   - Tag model would have a `has_and_belongs_to_many` r/s w Articles

2. The connection b/w the two models has a value of its own, so make it a real model:

- model called `Tagging` (the connection b/w Tags and Articles)
- an Article `has_many` Taggings
- a Tag `has_many` Taggings
- a Tagging `belongs_to` and Article and `belongs_to` a Tag

#### 2. Making Models: `Tag` and `Tagging` using Rails model generator

- field for Tag: `name`
- fields for Tagging: the types of the field are `references`
  - `tag_id`: Integer holding the **foreign key** of the referenced Tag
  - `article_id`: Integer holding the **foreign key** of the referenced Article
- rmb to migrate dbs after creating models

#### 3. Expressing relationships b/w models by adding relationships to respective `models/<model>.rb` files

- now an Article has a list of tags through the relationship of taggings.
  - in Rails, we **express** this "has many" relationship though an existing "has many" relationship. Update models to expresss that relationship **_through_** another "has_many" relationship:
    - `has_many :tags, through: :taggings`
    - `has_many :articles, through: :taggings`
- Now if we have an object like article we can just ask for `article.tags` or, conversely, if we have an object named tag we can ask for `tag.articles`.

#### 4. An Interface for Tagging Articles

- update the partial form template such that I can now input tags as comma separated words.
- then need to add the `tag_list` method to the **Article model**. Note that the method is written in the model's ruby file

- now, the array of tags is an array of Tag instances, so joining the array, Ruby called the `#to_s` method on each of the Tag instances. This gives some hexadecimal output and is _unwanted_. Make sure the `tag_list` method does:

  - converts tag objects to an array of tag names
  - joins the array of tag names together

    ```ruby
    def tag_list
      self.tags.collect do |tag|
        tag.name
      end.join(", ")
    end
    ```

- **OR**: define a new `Tag#to_s` method:

  ```ruby
  class Tag < ActiveRecord::Base

    has_many :taggings
    has_many :articles, through: :taggings

    def to_s
      name
    end
  end
  ```

- make sure you handle ruby's **strong parameters** properly, else you'll get **_unpermitted parameters_** error

  - update `app/helpers/articles_helper.rb` to fix `article_params` method
  - now you'll have to update the `create` method in the `ArticlesController` to account for the new attribute of `tag_list`

- Since the `create` method passes all the parameters from the form into the `Article.new` method, the tags are sent in as the string "technology, ruby". The `new` method will try to set the new Article’s `tag_list` equal to `"technology, ruby"` but that method (that `new` method(?)) doesn’t exist because there is no attribute named `tag_list`.

  - Solutions:
    1. **[easiest solution:]** pretend that there's an attribute called `tag_list`,
       - define `tag_list=` method inside `article.rb`, without deleting the original `tag_list` method. This is probably a setter method (?)

- now, we didn't create any tags either. We need to associate the article with tags that have the names... pseudocode:

  1: Split the tags_string into an array of strings with leading and trailing whitespace removed (so `"tag1, tag2, tag3"` would become `["tag1","tag2","tag3"]`
  So first we split the string, and then trim each and every element and collect those updated items.The `downcase` method is to make sure that "ruby" and "Ruby" don’t end up as different tags. Lastly, we want to make sure that each and every tag in the list is unique. `Array#uniq` allows us to remove duplicate items from an array.
  ruby code to be added to `tag_list=`method: `"programming, Ruby, rails, rails".split(",").collect{|s| s.strip.downcase}.uniq`

  2: For each of those strings…

  2a: Ensure each one of these strings are unique

  2b: Look for a Tag object with that name. If there isn’t one, create it.
  `tag = Tag.find_or_create_by(name: tag_name)`

  2c: Add the tag object to a list of tags for the article

  3: Set the article’s tags to the list of tags that we have found and/or created.
  eventual `tag_list=` method:

  ```ruby
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
  ```

#### 5. Adding Tags to Our Display

- modify show template to include tags and links to tags
- we need to let the router know about our Tag object, so you'll have to generate a controller for our Tag object
  - `bin/rails generate controller tags`
  - update `config/routes.rb`

#### 6. Listing Articles by Tag

- the links to the tags should list articles by Tag, so we need to add an action for that, and a corresponding template (justupdate the show template)

## Using Gems

### The `paperclip` library

Library that manages file attachments and uploading

#### 1. Using the Gemfile to Setup a RubyGEm

- old way: using zip or tar files. but this isn't easy to just upgrade to newer versions
- now we have Rails plugins as gems.
- RubyGems is akin to apt or RPM... a package manager
- Add `gem "paperclip"` to the Gemfile of the project
- Install `ImageMagick` via apt (ensure it's there)
- Stop running server, run `bundle` to install the required Gem(s) and the restart the server

#### 2. Setting up The Database for Paperclip

- for now, just say that the article can have **zero or one** image, just for demo sake
- Add some fields to Article model to hold the uploaded image, rmb to run a migration

  - it's a one-liner: `bin/rails generate migration add_paperclip_fields_to_article`

- udpate the `change` method inside the `_add_paperclip_fields_to_article.rb` file and then run a migration by doing `rake db:migrate`

#### 3. Add to the Article Model

- `has_attached_file` is a method from the paperclip lib. Allows paperclip to understand that the Article model should accept a file attachment and that there are fields to store info about that file which start with `image_`
- required to include a content_type validation, a file_name validation, or to explicitly state that they’re not going to have either.

  - if not, you get `MissingRequiredValidatorError` error

- also, deal w **mass assignment** and **strong parameters** by updating the `article_params` method to permit images

#### 4. Modifying the Form Template

- so we can upload file while editing the article
- add the image display to the article show template, update the form partial template:
  1.  Allow the **form** to accept **_multipart_** data.
  2.  Add a label and a field for file uploading before the save button
- update the article show view to display the image before the body of the article is placed

#### 5. Improving the Form (seems like latest gem version aldy does this automatically)

- in the form, allow the file_field to indicate whether a file has been updated and if so, which file has been updated

#### 6. Allowing Multiple Image Attachements [HELP I CAN'T DO THIS :(]

- a model(here, it's an Article) can have multiple attachements.
- Create a new model, call it "Attachment"

#### 7. SASS examples

- can just add style sheets and name it `style.css.scss` and Rails will handle the referencing to that sheet thanks to Rails' default layout

#### 8. Working with Layouts: how to manually set layouts

- in each template, add a reference style like so:

  - `<%= stylesheet_link_tag 'styles' %>`
  - this finds the stylesheet with the tag 'styles'
  - but this is **unnecessarily repetitive** so we look to using layouts

- see `app/views/layouts/application.html.erb`
  - Whatever code is in the individual view template gets inserted into the layout where you see the `yield`. Using layouts makes it easy to add site-wide elements like navigation, sidebars, and so forth.
  - this layout points to `app/assets/stylesheets/application.css` asindicated by the `stylesheet_link_tag` line

## Implementing Authentication

### Steps:

common but complicated authentication gems:

- [Authlogic](https://github.com/binarylogic/authlogic/)
- [Merchant (with tutorial)](http://tutorials.jumpstartlab.com/projects/merchant.html)
- [Devise](https://github.com/plataformatec/devise)
- [Sorcery: lightweight and easy to use gem](https://github.com/NoamB/sorcery)

#### 1. Install by Adding to Gemfile

- rmb to restart Rails server each time you update the Gemfile
- use `rails generate` to check which and if all gems installed properly

#### 2. Running the Generator (automates the model creation and data migration...)

- the plugin gives a generator that creates a model that represents our user and the required data migrations to support authentication
- just run the default generator:
  - `bin/rails generate sorcery:install --model=Author`
  - revise the SourceryCore migration that the generator has created, add/remove fields that you need in the database here
  - then do the database migration migration: `bin/rake db:migrate`

#### 3. Creating a First Account

- we could choose to use the console and create users and test the workflow, but noooo
- create and test our form-based workflow by creating a user through it
- we need to add CRUD support for our Author model!
  **_To this, instead of doing it manually, allow rails to generate the scaffolds_** :
  `bin/rails generate scaffold_controller Author username:string email:string password:password password_confirmation:password`

  - used scaffold_controller because Sorcery aldy defined for us an author model

  - rails has two scaffolds generators:

    - `scaffold`: generates the model, controller and views
    - `scaffold_controller`:generate the controller and views

  - scaffold generator didn't know that we want our password field and password confirmation field to use a password text entry, so we have to
    update `authors/_form.html.erb` and change the field type

  - allow for checking for password and password confirmation fields in that form. Add the `validates_confirmation_of` method call to the Author model itself
  - note that `password` and `password_confirmation` fields are **virtual attributes**. Sorcery uses given password along with the auto generated `salt` value to create and store the `crypted_password`

  - need to update `routes.rb` to add a resource for our Authors
  - remove hash and salt from author view > show and index templates

  - add footer to `app/views/layouts/application.html.erb` so that there's a login status at the footer

#### 4. Logging In

- need to build the actual endpoints for logging in and out, meaning **controller actions**:

  - **AuthorSessions** controller with these actions:
    - new
    - create
    - destroy
  - generate controller w rails generator and add the respective methods

- create new view template for the `new` action that will contain the login form

- config the routes to include the author_sessions ressources

- update the `app/views/layouts/application.html.erb` to include login page links in the footer layout

-

#### 5. Securing New Users

- Let’s add in a protection scheme like this to the new users form:

  - If there are zero users in the system, let anyone access the form
  - If there are more than zero users registered, only users already logged in can access this form

  That way when the app is first setup we can create an account, then new users can only be created by a logged in user.

- `before_filter` method that runs beforethe `new` and `create` actions of `authors_controller.rb`


## Heroku Deployment

### Steps: 

#### 1. Create Heroku Application

- `heroku create` 

#### 2. Config App by changing Gemfile to prevent sqlite3

- delete `gem 'sqlite3'`
  ``` ruby
  group :development, :test do
  gem 'sqlite3'
  end

  group :production do
    gem 'pg'
  end
  ```

- ofc after Gemfile change, update bundle

#### 3. Config Root Route

- edit `routes.rb` to set our root route if haven't. 
  - `root 'cars#index'` <--- example of what the root route should point at


## More Important Takeaways & Reminders

1. `rails` vs `bin/rails`. the latter is used to run scripts like the `generate` script

2. migration files:

   - `db/migrate/(some_time_stamp)_create_articles.rb`, the timestamp part is useful for organisation
   - the migration file only has one method called `change` where we write out how to do the `up` migration (the change), the undo methods are
     handled by Rails!
   - dbs have type `text` or `varchar` for large text fields. **database adapter** takes care of figuring out the best type, depending on the db in the config

3. `rake` is for running maintenance-like functions on your application (working with the DB, executing unit tests, deploying to a server, etc).

4. There's a technique called **reflection** whereby Rails queries the db, looks at the articles table, and assumes whatever columns that table has that should be the attributes for the model.

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

11. [Referential Integrity](https://en.wikipedia.org/wiki/Referential_integrity) has to be enforced for you to be able to delete tags, kiv [this concept for the future](https://guides.rubyonrails.org/association_basics.html)

12) **_Asset Pipeline_** Principle: a `require_tree` method auto loads all the stylesheets in the current directory, and includes them in `application.css`

13) **Virtual Attributes** in forms

14. **_manage security:_**

- **before filters** runs before new and create but I don't know where to put it in its controller

  ```ruby
  before_filter :zero_authors_or_authenticated, only: [:new, :create]

  def zero_authors_or_authenticated
    unless Author.count == 0 || current_user
      redirect_to root_path
      return false
    end
  end
  ```

* also, _control which links can be seen_ when like so:

  ```ruby
  <% if logged_in? %>

    <%= link_to "delete", article_path(@article), method: :delete , data: {confirm: "you sure you want to delete the post bruh??"}%>
    <%= link_to "edit", edit_article_path(@article) %>

  <% end %>
  ```
