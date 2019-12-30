# Self-Notes on Rails

[Rails Important Gotchas](https://betterexplained.com/articles/intermediate-rails-understanding-models-views-and-controllers/)

- [Self-Notes on Rails](#self-notes-on-rails)
- [Rails Big Picture](#rails-big-picture)
  - [Sinatra Basics](#sinatra-basics)
    - [Views Folder: HTML &amp; Forms](#views-folder-html-amp-forms)
  - [The ROR Hartl Tutorial: TOY App](#the-ror-hartl-tutorial-toy-app)
    - [purpose of tutorial](#purpose-of-tutorial)
    - [basic steps using rail's generators](#basic-steps-using-rails-generators)
      - [MVC Overview using One Model](#mvc-overview-using-one-model)
  - [HTTP Related info](#http-related-info)
  - [Understanding URL Components](#understanding-url-components)
  - [APIs](#apis)
  - [Cookies: allowing HTTP requests to have some state](#cookies-allowing-http-requests-to-have-some-state)
    - [Cookie Uses](#cookie-uses)
    - [Authentication](#authentication)
  - [Deployment (Heroku)](#deployment-heroku)
    - [Instances and Traffic](#instances-and-traffic)
    - [Heroku Domains and Naming](#heroku-domains-and-naming)
    - [Addons](#addons)
  - [Warmup Project: RestClient](#warmup-project-restclient)
  - [skipped the testing stuff, no time :( will get back to it when i finally get stuck and can't do anything elsewhere](#skipped-the-testing-stuff-no-time--will-get-back-to-it-when-i-finally-get-stuck-and-cant-do-anything-elsewhere)
  - [Hartl ROR Tutorial Chapter 3: Static Pages](#hartl-ror-tutorial-chapter-3-static-pages)

I really am behind schedule and may not have enough time. Just gonnna put links here instead.

Basically, the **Rails Guides** are your gods.

# [Rails Big Picture](https://stackoverflow.com/questions/5205002/summary-of-ruby-on-rails-fundamental-concepts)

![big picture](/img_59bf3a1ac4304-1024x430.png)

- naming convention

  - Model: **singular** (e.g. `Resturant`)
    - `ActiveRecord` methods, linked to the model, so are **singular**
      - e.g. `Restural.all`, `Restaurant.find(params[:id])`
  - Associations: has_many (**plural**) and belongs_to(**singular**):

    ```ruby
    class Restaurant < ActiveRecord::Base
    has_many :reviews
    end

    class Review < ActiveRecord::Base
    belongs_to :restaurant
    end
    ```

  - Routes
    - Resources are **plural** :
      `resources :restaurants`
    - Route Helpers:
      - `index`: **plural** `restaurants_path`
      - `show`: **singular** because we are showing just one element, it needs the element inside paranthesis (`restaurant_path(@restaurant)`)
      - `new`: **singular** `new_restaurant_path`
        Controller: **plural** (e.g. `Restaurants`)
  - Table in the DB: **plural** (e.g. `restaurants`)
  - URLs: **plural** (e.g. `/restaurants, /restaurants/:id, /restaurants/new`)

## Sinatra Basics

- [Use Sinatra Readme for reference, there's literally everything here](http://sinatrarb.com/intro.html)

- [Ruby Monstas Sinatra Guide. Something I actually managed to understand](http://webapps-for-beginners.rubymonstas.org/sinatra/dsl.html)

* Sinatra is a **_Domain Specific Language (DSL)_**: a piece of code or library that provides classes and methods that allow us to “speak about them”, or implement them, in the form of code.

  - the domain here is

* like a bare bones version of Rails, helps reduce the Rails learning curve
* doesn't create the file structure for you
* learning aim:

  - how to set up routes
  - organizing views

- note: sinatra server file changs are not auto reloaded, so need to stop and restart the server, or set up the sinatra reloader:
  - `gem install sinatra-contrib` and add a require statement for the reloader

### Views Folder: HTML & Forms

covered:

- erb injection
- debugging using params method

- mkdir `views`

- rendering html and using erb in html templates, learning point is how the call is made e.g.

  ```ruby
  get '/' do
  erb :index, :locals => {:number => generate_number}
  #   "render the ERB template named index and
  #   create a local variable for the template named number which has the same
  #   value as the generate_number meethod's return from this server code."
  end
  ```

- form generation. submission of the form changes the URL to reflect the input done via the form

- **for debugging, use `throw params.inspect`** to analyse what the data looks like inside the server
  - if `params`method reutrns Ruby hash like so: `uncaught throw "{\"guess\"=>\"26\"}"`, then if we write `params["guess"]`, we should get back the value of that key...

## [The ROR Hartl Tutorial: TOY App](https://www.learnenough.com/ruby-on-rails-4th-edition-tutorial/toy_app)

### purpose of tutorial

- to use the **_scaffold generators_** that Rails offers and then to go beyond the utilization of scaffolds
- see the REST architecture favoured by Rails

Details and Planning about the App:

- users
- microposts (twitter like)

* just deploy asap so can run the server and use the changes to debug and lead you through

### basic steps using rail's generators

1. add `hello` action (method) to Application Controller at `app/controllers/application_controller.rb`
2. Set root route at `config/routes.rb`
3. deploy onto heroku
4. create data model, a representation of the structures needed by our app
   - i.e. the table and fields, as well as what types the fields will be of

**Toy Model for Users:**
  - the table name (`users`)and fields `id`, `name`, `email`
  - 
**Toy Model for Microposts:**
  - the table name `microposts` has field `id` and `content` and `user_id`

5. Implement the ***Users model*** along with a web interface to that model. Collectively, this is called the **_Users Resource_**
   - these objects have CRUD actions that can be done, via HTTP protocol
   - note that resources are like "things" in your database or data model
  
6. Migrate database (since the model, and hence the table was generated) to ***update the database with a data model***. note that legacy apps used `rake` to do the db migration, after rails 5, we use `rails` instead. 
  Rake is basically Ruby's make


  #### MVC Overview using One Model

  ![mvc overview](/home/ritesh/coding/Odin-Project/backend/rails/detailed_mvc.png)

1. The browser issues a request for the /users URL.
2. Rails routes /users to the index action in the Users controller.
3. The index action asks the User model to retrieve all users (User.all).
4. The User model pulls all the users from the database.
5. The User model returns the list of users to the controller.
6. The controller captures the users in the @users variable, which is passed to the index view.
7. The view uses embedded Ruby to render the page as HTML.
9. The controller passes the HTML back to the browser.3


[Another Explanation for MVC](https://betterexplained.com/articles/intermediate-rails-understanding-models-views-and-controllers/)

- Controller: 
  - follows RESTful architectural design (Representational State Transfer), where most application components (such as users and microposts) are modeled as resources that can be created, read, updated, and deleted—operations that correspond both to the CRUD operations of relational databases and to the four fundamental HTTP request methods: `POST`, `GET`, `PATCH`, and `DELETE`.
  - all the controllers inherit from `ApplicationController` class  ![inheritance](demo_controller_inheritance.png)
  - contains a collection of ***related actions***
    - these actions can render pages, but not necessarily 
      - you may have different actions corresponding to the same URL. Just means that the HTTP method is different
        e.g. `update` and `show` both point to URL `/users/1` but diff request method
    - purpose: modify users in the database

    ```ruby
    #  schematic of a controller, e.g. for users controller at: app/controllers/users_controller.rb
    class UsersController < ApplicationController
      .
      .
      .
      def index
        .
        .
        .
      end

      def show
        .
        .
        .
      end

      def new
        .
        .
        .
      end

      def edit
        .
        .
        .
      end

      def create
        .
        .
        .
      end

      def update
        .
        .
        .
      end

      def destroy
        .
        .
        .
      end
    end
    ```
10. Generate the model for Microposts using the scaffolding
11. Add Validations to models:
    1.  character length validation (update the model's file `app/models/micropost.rb`)
12. Write out the ***associations*** between different data models
    - rails, using **ActiveRecord** can infer the associates with the various data models

## [HTTP Related info](https://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177)

- One key component to pay attention to is the fact that the request and response both have header and (usually) body components. The header contains information about the request or response itself (meta data), including which website to send or return to and what the status of the response is. The body of the request can contain things like data submitted by a form or cookies or authentication tokens while the response will usually contain the HTML page you’re trying to access.
- The other key component is that each request uses one of four main “verbs” – GET, POST, PUT, and DELETE. These days, you almost only see GET and POST requests (even if you’re trying to do a delete of something they usually fake it using a POST request), but it’s important to understand the difference between the verbs.

## [Understanding URL Components](https://www.mattcutts.com/blog/seo-glossary-url-definitions/)

- protocol
- hostname
  - subdomain name
  - domain name
- TLD
  - SLD
- Port (if 80, can just leave out since it's standard)
- Path : typically to a file or location on the webserver 
- URL parameters:
  - separated by `&`
  - literally parameter name with value
- Fragment/Named Anchor: 
  - used to refer to an internal section within a webdocument (skip-to)


Sytatic vs dynamic urls: 
  - dynamic requires webservers to do some computation
    - usually has a `?` in the url, but not necessarily 


## APIs

- mode of communication b/w web services
- usually via XML, this communication happens over the Internet
- webdev programs new or existing software to generate the right XML messages to tap the power of remote applications. 
- APIs are released usually as part of larger SDKs by companies


## Cookies: allowing HTTP requests to have some state

- types: session cookies and persistent cookies

- generated upon browser loading of a particular
- exists as a textfile that is generated by the browser, so when requests are made, this file is part of that request
  

### Cookie Uses

- authentication cookies: authenticate user if user logs into secure area of website; login info sotred in cookie to prevent re-authentication
- session cookies act as a sort of bookmark, and store some "memory" of what user interaction had happened in previous sessions
- persistent/tracking cookies for user fingerprinting
- cookies can't be executed and can't replicate, hence aren't viruses
  - can be used as spyware though
- rmb to describe clearly what cookies your webapp uses
- browsers can create cookies also

### Authentication

- use the `Devise` gem
- 




## [Deployment (Heroku)](https://www.theodinproject.com/courses/ruby-on-rails/lessons/deployment?ref=lnav)


### Instances and Traffic

- virtual dynos: each dyno is an instance of the app running at one time
- dynos can go to sleep if no requests are made in a while. Can think of having a system to periodically ping the application


### Heroku Domains and Naming

- can set custom domains if you want

### Addons 
 
- New Relic: runtime analysis
- PGBackups: backup service, can set up rake tasks to do this too though
- SendGrid: email service




## [Warmup Project: RestClient](https://www.theodinproject.com/courses/ruby-on-rails/lessons/let-s-get-building?ref=lnav#warmup-restclient)

- [documentation for the gem](https://github.com/rest-client/rest-client)

- gem that helps make HTTP requests; gem can be used to communicate with another web service that doesn’t have an API library already written out for you (which is pretty rare these days) or if you get the inclination to test your own API from the command line.

## ***skipped the testing stuff, no time :( will get back to it when i finally get stuck and can't do anything elsewhere***


## [Hartl ROR Tutorial Chapter 3: Static Pages](https://www.learnenough.com/ruby-on-rails-4th-edition-tutorial/static_pages)


- aims:
  - learn how to build static sites 
  - automated testing and refactoring code
  - 


