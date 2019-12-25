# Front End Notes: Git + HTML/CSS/JS

- [Front End Notes: Git + HTML/CSS/JS](#front-end-notes-git--htmlcssjs)
  - [TODO](#todo)
  - [BASIC SETUP:](#basic-setup)
  - [LEARNING ABOUT GIT:](#learning-about-git)
  - [In-depth GIT](#in-depth-git)
    - [Best Practices](#best-practices)
    - [Terminology](#terminology)
    - [](#)
  - [FRONT END BASICS:](#front-end-basics)
    - [HTML:](#html)
    - [HTML:](#html-1)
      - [HTML DOG TUTORIAL:](#html-dog-tutorial)
        - [ERB: embedded ruby: ruby lib to dynamically generate HTML data](#erb-embedded-ruby-ruby-lib-to-dynamically-generate-html-data)
        - [Dealing w Files: how everything ties up to form a webpage:](#dealing-w-files-how-everything-ties-up-to-form-a-webpage)
        - [INTERMEDIATE-LEVEL HTML ELEMENTS:](#intermediate-level-html-elements)
    - [CSS:](#css)
    - [JavaScript:](#javascript)

---



## TODO

1. [useful book about git](http://think-like-a-git.net/sections/about-this-site/who-this-site-is-for.html)


Mon Dec 9 11:15:07 +08 2019

## BASIC SETUP:

1. syncing github:

   - install binaries on local machine
   - generate ssh key, pwd protected and stored on local host
   - sync via browser to github account

2. testing first rails app

   - error: can't create on a mounted drive that syncs w rsync, so
     use a local dir instead. Everything works well
   - pushing commit to github

3. setting up Heroku account:

   - after installing,
   - add public keys on local host to Heroku
   - create a Heroku app
     = prep rails for Heroku Deployment =

   - migrate to Heroku
   - start and play around w template webapp :)

## LEARNING ABOUT GIT:

Mon Dec 9 15:15:20 +08 2019

- git learning resources:

  - [cheat sheet](https://education.github.com/git-cheat-sheet-education.pdf)
  - [youtube vid](https://www.youtube.com/watch?v=HVsySz-h9r4)
  - [Git CLI basics](https://git-scm.com/book/en/v2/)
  - [Git workflows](https://www.git-tower.com/learn/git/ebook/en/command-line/basics/basic-workflow#start)

- remember to pull first before pushing code when you want to make a commit

- common worflow:

  1. create a branch, name it appropriately.
  2. checkout and work on it
  3. push from local to remote repository

- merging:

  - checkout master and then pull it in case any new changes made onto master
  - then check merged branches
  - then merge the ready branch
  - then push the changes onto the (remote) master
  - delete that local branch and check all branches

- [todo][generic gitignore templates](https://github.com/github/gitignore)

- **NB:** there are two repos:
  - local repository: in the .git folder of the root dir of your project
  - remote repository: on the remote server on internet/local network
- Origin is the placeholder name for the URL of the remote repository. Can use Origin to access
  the remote repository without having to enter a full URL each time. Hence, we can have multiple remotes
  for a repository by giving each a unique name

## [In-depth GIT](https://www.theodinproject.com/courses/ruby-programming/lessons/using-git-in-the-real-world?ref=lnav)

- [useful book about git](http://think-like-a-git.net/sections/about-this-site/who-this-site-is-for.html)


### [Best Practices](https://sethrobertson.github.io/GitBestPractices/)

- keep commits modular and specific
- Your commit message should fully describe (in present tense) what the commit includes
- write down on pen and paper on the approaches and fixes you want to do. Helps prioritize problems
  

### Terminology

- `upstream`: the original Github repo
- `origin`: my fork of that repo
- my local clone of the `origin`. local can only pull from upstream, and not push


### 


## FRONT END BASICS:

Mon Dec 9 18:48:45 +08 2019

- resources:

  - [HTML documentation pages](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)
  - [MDN CSS keywords index](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference#Keyword)
  - [JavaScript References](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)

- FRONT END REFERENCES:

  - [css centering elements](https://css-tricks.com/centering-css-complete-guide/)
  - [css grid style](https://css-tricks.com/snippets/css/complete-guide-grid/)
  - [flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
  - [HTML cheatsheet](http://overapi.com/html)
  - [CSS cheatsheet](http://overapi.com/css)

  RMB JUST RELY ON BOOTSTRAPPING: - modify using the browser to get your nice layouts and all -

Big Picture on how the Front End of Web Dev is handled:

- how the web page is STRUCTURED (HTML), how it LOOKS (CSS), and how it
  FUNCTIONS (JavaScript).
- your browser handles figuring out how to make these files into a functioning
  web page (not the server).

- front end dev roles:
  - convert designers' work to code
  - handle the user interactions (UI elements)
  - strong understanding of accessibility and things
    like responsive development down the line

### HTML:

- browser's role is to make a request for the html file from some url and
  then display that html
- only defines the semantic structure of a document, no info about the visual representation

- there is a purpose to discretely defining the semantic structure:
  --> can let other code do the appearance, interesting things like
  theme is possible over the same content
  --> search engines use this by figuring out how a particular webpage is referenced
  by other webpages
  --> can automate some things like creating a contents table

- one could say that the primary purpose of web applications is to produce HTML
  so it can be sent to web browsers.

### HTML:

- elements and attribute tags: can use attribute tags and their respective attribute
  values to identify the element for style info and other reasons.

- elements can be nested but not overlapped

- empty elements exist (e.g. images) that have no other content. This works
  because an image element doesn't wrap content to affect it. Its purpose is
  to embed an image in the HTML page in the place it appears.

- after the doctype, the `<html> </html>` tags refer to an element that is also called
  the root element.

- the head element contains metadata:
  . keywords
  . page description
  . CCS and charset declaration...

- just set charset as utf-8 in the head of the html file to avoid encoding issues

- purpose of the alt attribute:
  if the source attribute's value is incorrect then the value of the
  alt attribute will be displayed, indicating an error in the source
  attribute's value. keep the alt attribute descriptive for debugging.

- links and href attribute, rmb to indicate the protocol used (https://)
  `href`: hypertext reference

#### HTML DOG TUTORIAL:

- image file types and uses:
  - JPEG: normal compression, compression inversely proportional to file size and clarity
  - GIF : use for logos and solid colours, pixels are allowed to be transparent
  - PNG : sim to GIF but more colours and alpha transparency! (translucent pixels)
- image and video input into html files

- tables

- FORMS! [very useful]

  - Form fields require names. add the name attribute to every one of them
    omission means that the data of that input field will not be sent at all

    - action attribute: links to a script file to which the input data will be sent to
    - target attibute: will submitted result open in a new tab, frame or current window?
      values:
      \_self --> submitted in the current window
      \_blank --> form result opens in a new browser tab
      \_parent
      \_top
    - method attribute: method of sending the info (method either get or post) via HTTP
    - input tag: with multiple types: text, password, radio, checkbox, submit...
    - textarea: just textbox
    - select tag: to allow dropdown options

##### ERB: embedded ruby: ruby lib to dynamically generate HTML data

- embed some Ruby code into an HTML document(aka template).\
- keywords:
  - binding
  - ruby kernel method

##### Dealing w Files: how everything ties up to form a webpage:

- filenaming:

  - all lowercase, separate w hyphen rather than underscore
    --> because Google search engine treats hyphen as a word separator and not underscore

- common structure:
  . index.html
  . images folder
  . styles folder
  . scripts folder

- for communicating b/w files, provide a filepath. It's like a relative
  path you provide to the index.html file. Similar to shell paths when
  navigating dirs. NB: on windows, use / instead of \ (follow bash)

##### INTERMEDIATE-LEVEL HTML ELEMENTS:

- use id and class attribute so that the HTML can refer to the CSS
  put them in the opening tag
  ID: used to identify one element
  class: can be used to identify morethan one element

- `span` and `div` elements : grouping of html elements, use together with classes and IDs

  - span is in-line, div is block-line

- abbreviations
- quotations:
  . `q` for inline quotations
  . `blockquote` for multi-line quotations
  . `cite` attribute: from the web:

- meta tags: mainly for search-engine purposes
  put inside the head element
  attributes:

  - `charset`
  - `name`
  - `http-equiv`: refers to the http header (used instead of the name attribute)
    you can set refresh and time, or control redirects from this...
  - content
  - description (used for search-engine description)

- tables: header cells, spanning columns and rows

- description list: (a complicated form of `ul` `ol` elements)
  . structure: `dl` -> `dt` (terms) -> `dd` (descriptions)
  .

- other elements:
  . `addresses`
  . `definition` terms
  . bi-directional text
  . editorials: ins and del

- ARTICLES AND SECTIONS useful and pretty for handling page layouts
  -header
  -footers
  -asides :
  -navigation: markup a group of nav links

- **_hacks_**: html shiv add to header of html file to teach older browsers to function properly:

### CSS:

- to the index.html file, you're going to put the path to the css file within
  the head element.

- CSS ruleset (rule for short) structure:
  . selector
  . declaration: property & property value make up the declaration

  the property you want to style has to be a valid property of the
  selected element

  syntax:

  - ruleset wrapped around with `{}`
  - each declaration, property `:` property value. Note the colon
  - declarations separated by `;`

- can have **multiple selectors** for the same ruleset. element types are
  therefore comma separated.

- various selectors:

  - element/tag/type selector
  - ID selector
  - Class selector
  - attribute selector
  - pseudo class selector

- fonts:
  . need to link the font file link in the header of the index.html

- keep the boxes analogy in mind!:
  . padding
  . border
  . margin

- if your element is unstyled, then the browser might add some
  default styling to the element. In which case, you can and might
  want to ovrride the browser defaults!

[HTMLDOG TUTORIAL done here](https://www.htmldog.com/guides/css/beginner/)

- Ways of Applying CSS:

  - inline
  - internal / embedded (put it near the html closing tags) using a style tag
  - external (best practice of sorts)

- HTML tags and CSS selectors
  => selectors are names given to sytles in internal and external style sheets

- Lengths and Percentages:
  for value 0, no unit specification required
  general units that aren't property specific:

  - `px` ==> pixels
  - `em` ==> calculated size of a font, e.g. 2em is twice current font size
  - `pt` ==> points, for measurments printed in media
  - `%` ==> _hahahaha_
  - `pc`, `mm`, `cm`, `in`

- CSS colours:

  - format types: name, RGB value, hex code
    - predefined names exist(including transparent)
    - 3 digit hex codes are compressed versions of the actual 6 digit hex codes.
      6 digit version gives more control over the exact colour..
    - css3 allows us to control the **HSL colours**: hue, saturation, lightness (translucency..)
    - attribute type **_color_** written in American english!

- CSS text manipulation:

  - font family: browser searches for font family, so select safe fonts instead.
    . can specify multiple fonts, comma separated in order of priority.
    multiple options for viewing them.
  - font weight: bold or normal but it's a spectrum! ranges from 100 to 900 or descriptive terms
  - text decoration:
    . underline
    . overline
    . line-through (strikethrough's actual term)

  - text-transform: handles lower/uppercases

  - text spacing: (lenght/ normal)
    . letter-spcacing
    . word-spacing
    . line-height
  - text-align
  - text-indent

- box model! : borders, padding, margin...

- NESTING OF CSS selectors within overall selectors e.g. #top -> #top h1 -> #top p

[very useful stuff:!]

- CSS Pseudo Classes: form:

  ```css
  selector:pseudo_class { property: value; }`
  ```

  . links: e.g. univisited blue colour visited purple colour

  . Dynamic Pseudo Classes: to apply styles when something happens to something (e.g. change sytle when mouse hovers over it) - active : activation event (e.g. user click)

        - hover
        - focus : gains focus, selected by or ready for input.
            form elements rely on focus. can use for links also

- CSS shorthand properties:
  . passing your margins/padding/font and such properties as a one-liner instead of separating it
  into it's specified properties and values.

- backgrounds can be used to underlay images and all also, take Note

- CSS conflicts and specificity:
  factors that give precedence:

  - more specific one wins (esp if it's encapsulated within a div element)
  - last one wins if all else same specificity
  - there are number values you can estimate for specificity: [see this table for specificity values](https://www.htmldog.com/guides/css/intermediate/specificity/)

- DISPLAY TYPES: `inline`, `block`, `none`

- CSS Psudo Elements: form of
  ```css
  selector:pseudoelement {
    property: value;
  }
  ```
  - first-letter
  - first-line
  - Before and After Content:
    can place content on either side of a box without touching the html
    [useful trick, use sparingly]

- Page Layout: take parts of a page and place it absolutely or relative to another part!

  - Positioning of elements
    - property values:
      . static: normal way
      . relative: box can be offset from original position with properties like top, right, bottom, left
      . absolute: places a box absolutely on the page
      . fixed: absolute but in reference to a browser window
    - Layout using Absolute Positioning:  
       . create traditional two column layout

  - Floating ***[useful, research when needed]***

- Default browser styles and CSS reset [future use]
  . look for reset code online and add the .css file to the header
  to override browser default style

### JavaScript:

- same with the css elements, your js file are referenced in index.html near the
  end of whichever element the script applies to (?) with the element tag of script

- good practice to put the js near the bottom of the HTML page.

