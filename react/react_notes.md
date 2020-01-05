[react course taken from this](https://scrimba.com/p/p7P5Hd/cWKkvVuL)

# reactJS

- [reactJS](#reactjs)
  - [why react?](#why-react)
  - [basics](#basics)
    - [creating functional components](#creating-functional-components)
    - [Organisation: putting components into separate files!](#organisation-putting-components-into-separate-files)
    - [React Parent/Child components](#react-parentchild-components)
    - [Styling](#styling)
      - [Adding className to JSX](#adding-classname-to-jsx)
      - [Inline Styling using the Style Property](#inline-styling-using-the-style-property)
    - [JSX to Js and Back](#jsx-to-js-and-back)
    - [Props](#props)
    - [Mapping Components in React [using JS higher order array methods]](#mapping-components-in-react-using-js-higher-order-array-methods)
  - [Class-Based Components](#class-based-components)
  - [state](#state)
    - [event handling](#event-handling)
  - [Lifecycle Methods](#lifecycle-methods)
  - [Conditional Rendering](#conditional-rendering)
  - [Fetching Data from and API](#fetching-data-from-and-api)
  - [React Forms](#react-forms)
    - [Controlled Components](#controlled-components)
      - [textarea Tag](#textarea-tag)
      - [input type](#input-type)
        - [checkboxes](#checkboxes)
        - [radio butttons](#radio-butttons)
      - [select Tag](#select-tag)
      - [file input Tag](#file-input-tag)
    - [Handling Multiple Inputs](#handling-multiple-inputs)
    - [Submissions](#submissions)
  - [React Container &amp; Component Architecture: separation of concerns](#react-container-amp-component-architecture-separation-of-concerns)
  - [Modern React:](#modern-react)
  - [Hooks](#hooks)
    - [useState() hook](#usestate-hook)
    - [useEffect() hooking onto lifecycle methods from a functional component](#useeffect-hooking-onto-lifecycle-methods-from-a-functional-component)

## why react?

- speed via virtual DOM
- ability to create reusable web components, makes it more readable

## basics

- react and react-dom are the dependencies,

  - `ReactDOM.render(WHAT DO I WANT TO RENDER, WHERE DO I WANT TO RENDER IT)`
    - the location of where you want to render is referring to a HTML node (which acts as a container of sorts)
    - the what you want to render is JSX code! the react lib is the one that enables jsx to work
      - you can't render two adjacent JSX elements but you can wrap it as one whole element....

- the js is just going to be turned to html components

just a sample example:

```javascript
import React from "react";
import ReactDOM from "react-dom";

ReactDOM.render(
  <ul>
    <li>1</li>
    <li>2</li>
    <li>3</li>
  </ul>,
  document.getElementById("root")
);
```

### creating **_functional components_**

- capital camel case for functional components.

  ```javascript
  import React from "react";
  import ReactDom from "react-dom";
  const MyInfo = () => {
    return (
      <div>
        <h1>Ritesh Kumar</h1>
        <p>just a cs noob trying to make up for lost time and Cap points :')</p>
        <ol>leh</ol>
        <ol>kashmir</ol>
        <ol>israel</ol>
      </div>
    );
  };
  ReactDom.render(<MyInfo />, document.getElementById("root"));
  ```

  and then subsequently call it like so:

  ```javascript
  ReactDOM.render(<MyApp />, document.getElementById("root"));
  ```

- functional components can't have multiple adjacent HTML elements, same rules apply, just wrap in a div to nest elements!
- the components have all jsx and they can be composed together!!
- components can generate other components!!
- **_don't forget the return statement and the parentheses(for readability sake)_**

### Organisation: putting components into separate files!

- just put all components in to a components subdir Just have **_some organisational structure_**
- usually you put each react component into its own file.
- write out the necessary import and export statements first!!
  - you'd have to import "react" so that you can write in JSX!
  - you'll have to write an export statement like so:
    - `export default <name of component>`
    - now the index.js file you'll have to import this component file into index.js. note that you'll have to supply it with a **relative path** if not you'll end up with
      - `import MyInfo from "./MyInfo.js"` the .js is not really necessary because by default it's .js

### React Parent/Child components

![diagram](/component_parent_child_example.png)

- distinguishing components `<MyInfo/>` and (HTML) elements `<div>...</div>`.
- similar to how DOM can be visualised as a dom tree, we can see our components having a tree-like structure where the leaves are HTML elements and the root is the outermost component
- now the App.js component will look something like this!

  ```javascript
  import React from "react";
  import Footer from "./Footer";

  function App() {
    return (
      <div>
        <Header />
        <MainContent />
        <Footer />
      </div>
    );
  }

  export default App;
  ```

  NB: `<footer>...</footer>` refers to the special HTML elements but `<Footer />` refers to the js component that you have created, see naming conventions to know how to identify!
  likewise `<header>...</header>`


    example of a basic todo component!

    ```javascript
    import React from "react"

    function App() {
        return (
            <div>
                <input type="checkbox" />
                <p>Placeholder text here</p>

                <input type="checkbox" />
                <p>Placeholder text here</p>

                <input type="checkbox" />
                <p>Placeholder text here</p>

                <input type="checkbox" />
                <p>Placeholder text here</p>
            </div>
        )
    }

    export default App
    ```

### Styling

a few ways to style:

#### Adding `className` to JSX

- same as adding a class to HTML but since it's JSX, we got to change it a little an call it `className` instead
  - because: JS using the vanilla JS DOM api, where adding class is done via `.className` or `.classList`
- now we just go to the `style.css` stylesheet and add in the CSS rules we want by calling the correct classnames as defined in the JSX code

- this use of `className` can be done only to React elements (HTML elements) and not React components for such styling behaviour

#### Inline Styling using the Style Property

- JSX rules, when you want to give value to the style property, you can't pass in a string (like you would for HTML), you have to pass in an object
  which would be `{color: red}`. **BUT** for the thing to be seen as a Javascript object, you have to shift back from JSX to Js, so have to wrap this in `{}`
  eventually you get **_two sets of curly braces_**:

  ```javascript
  return <h1 style={{ color: "#FF8C00" }}>Good {timeOfDay}!</h1>;
  ```

  rmb JS no `-` in the naming, the naming convention is camecase, so you'd expect `background-color` to be written as `backgroundColor` instead:
  `<h1 style={{color: "#FF8C00", backgroundColor: "#FF2D00"}}>Good {timeOfDay}!</h1>`

  NB: the object values are all strings

- good practice: create a separate `styles` variable which contains your JS object instead:
  This allows you to do some logic on the styles object!

- Inline styling allows you to have dynamic data that allows your hardcoded components display:

  ```javascript
  import React from "react";
  import ReactDOM from "react-dom";

  function App() {
    const date = new Date(2018, 6, 31, 15);
    const hours = date.getHours();
    let timeOfDay;
    const styles = {
      fontSize: 30
    };

    if (hours < 12) {
      timeOfDay = "morning";
      styles.color = "#04756F";
    } else if (hours >= 12 && hours < 17) {
      timeOfDay = "afternoon";
      styles.color = "#8914A3";
    } else {
      timeOfDay = "night";
      styles.color = "#D90000";
    }

    return <h1 style={styles}>Good {timeOfDay}!</h1>;
  }

  ReactDOM.render(<App />, document.getElementById("root"));
  ```

### JSX to Js and Back

-basically allow your js file to do some logic using js and what you return shall be in the form of JSX, with JS embedded within it to pass in values

- within JSX, you can wrap JS within curly braces like so:

  ```javascript
  // index.js
  import React from "react";
  import ReactDOM from "react-dom";

  function App() {
    const date = new Date();
    const hours = date.getHours();
    let timeOfDay;

    if (hours < 12) {
      timeOfDay = "morning";
    } else if (hours >= 12 && hours < 17) {
      timeOfDay = "afternoon";
    } else {
      timeOfDay = "night";
    }

    return <h1>Good {timeOfDay}!</h1>;
  }

  ReactDOM.render(<App />, document.getElementById("root"));
  ```

### Props

- i think it's about making components dynamic

- HTML elements have their attributes/properties and you'd want to be able to change the way the properties.
  instead of using the built-in html tags, since we are creating our own components, we can make it such that our properties to modify the way that the component acts

- also really helps make your code reusable!!

- components are function components, you can then add parameters to these component functions and this allows us to account for the particular attribute passed in

  - the input param for your functional component is named `props` by convention. Props: is an object that has properties of that object, each one being the name of prop that you passed in

    ```javascript
    // App.js
    import React from "react";
    import ContactCard from "./ContactCard";

    function App() {
      return (
        <div className="contacts">
          <ContactCard
            contact={{
              name: "Mr. Whiskerson",
              imgUrl: "http://placekitten.com/300/200",
              phone: "(212) 555-1234",
              email: "mr.whiskaz@catnap.meow"
            }}
          />

          <ContactCard
            contact={{
              name: "Fluffykins",
              imgUrl: "http://placekitten.com/400/200",
              phone: "(212) 555-2345",
              email: "fluff@me.com"
            }}
          />

          <ContactCard
            contact={{
              name: "Destroyer",
              imgUrl: "http://placekitten.com/400/300",
              phone: "(212) 555-3456",
              email: "ofworlds@yahoo.com"
            }}
          />

          <ContactCard
            contact={{
              name: "Felix",
              imgUrl: "http://placekitten.com/200/100",
              phone: "(212) 555-4567",
              email: "thecat@hotmail.com"
            }}
          />
        </div>
      );
    }

    export default App;

    // ContactCard.js
    import React from "react";

    function ContactCard(props) {
      console.log(props);
      return (
        <div className="contact-card">
          <img src={props.contact.imgUrl} />
          <h3>{props.contact.name}</h3>
          <p>Phone: {props.contact.phone}</p>
          <p>Email: {props.contact.email}</p>
        </div>
      );
    }

    export default ContactCard;
    ```

    NB: usually your attributes aren't hardcoded, but are coming in through some data file such as a JSON file

* tips: settle the tree first, the focus on the values being passed around

### Mapping Components in React [using JS higher order array methods]

- usually data is fetched via HTTP calls to an API and using JSON to pass the API around
- if your data in file `jokesData.js` which has an array, then you can apply higher order functions onto this array (where each )
- you can put an array of components directly into JSX...
- react expects akey prop on repeated components, so have to assign some unique key attribute to items


    ``` javascript
    //TodoItem.js:
    import React from "react"

    function TodoItem(props) {
        return (
            <div className="todo-item">
                <input type="checkbox" checked={props.item.completed}/>
                <p>{props.item.text}</p>
            </div>
        )
    }

    export default TodoItem


    // App.js: the overall component that the index component calls
    import React from "react"
    import TodoItem from "./TodoItem"
    import todosData from "./todosData"

    function App() {
        const todoItems = todosData.map(item => <TodoItem key={item.id} item={item}/>)

        return (
            <div className="todo-list">
                {todoItems}
            </div>
        )
    }
    export default App
    ```

    ```javascript

    // todosData.js: mimics how the API will be passed in...
    const todosData = [
        {
            id: 1,
            text: "Take out the trash",
            completed: true
        },
        {
            id: 2,
            text: "Grocery shopping",
            completed: false
        },
        {
            id: 3,
            text: "Clean gecko tank",
            completed: false
        },
        {
            id: 4,
            text: "Mow lawn",
            completed: true
        },
        {
            id: 5,
            text: "Catch up on Arrested Development",
            completed: false
        }
    ]

    export default todosData
    ```

    ```javascript
    // index.js
    import React from "react"
    import ReactDOM from "react-dom"

    import App from "./App"

    ReactDOM.render(<App />, document.getElementById("root"))
    ```

## Class-Based Components

- functional components are conceptually easier to understand but there are some limitations to functional components (e.g can't keep track of state and lifecycle methods )

  comparison b/w the two:

  ```javascript
  import React from "react";

  function App(props) {
    return (
      <div>
        <h1>{props.whatever}</h1>
      </div>
    );
  }

  class App extends React.Component {
    render() {
      // do any display logic here, before the return statement, or create a separate method for this and call that method..
      return (
        <div>
          <h1>Code goes here</h1>
        </div>
      );
    }
  }

  export default App;
  ```

- **_set up your display logic (what to show and what style..) within the `render` method before the return_**. You could put your own method

- you could set up your own method outside the render method too, and then call it from the render method
  - if you set up your own method, then you'll have to call it using something like `this.myMethod` the this is important
- **_NB: _**class based components, you have to change the way to access props :
  `{this.props}` instead of `{props}` directly!! important gotcha when converting from a functional component to a class based component


    ```javascript

    import React, {Component} from "react"
    import ReactDOM from "react-dom"

    // #1
    class App extends React.Component {
        render() {
            return (
                <div>
                    <Header username="vschool"/>
                    <Greeting />
                </div>
            )
        }
    }

    // #2
    class Header extends React.Component {
        render() {
            return (
                <header>
                    <p>Welcome, {this.props.username}!</p>
                </header>
            )
        }
    }

    // #3
    class Greeting extends Component {
        render() {
            const date = new Date()
            const hours = date.getHours()
            let timeOfDay

            if (hours < 12) {
                timeOfDay = "morning"
            } else if (hours >= 12 && hours < 17) {
                timeOfDay = "afternoon"
            } else {
                timeOfDay = "night"
            }
            return (
                <h1>Good {timeOfDay} to you, sir or madam!</h1>
            )
        }
    }
    ReactDOM.render(<App />, document.getElementById("root"))
    ```

## state

- state here is an object! so write it as an object with key-value pairs
- data can be maintained and changed as you need it to
- props, the other way to pass data from a component to another component, are immutable
- need to use class based components for states...

- constructor method initialises parts of a class.
- make a call to global constructor called `super` to inherit parent classes..
- States can be passed from parent to child component (thorugh props)


    ```javascript
    import React from "react"

    // https://scrimba.com/p/p4Mrt9/cQnMDHD

    class App extends React.Component {
        constructor() {
            super()
            this.state = {
                answer: "yes"
            }
        }

        render() {
            return (
                <div>
                    <h1>Is state important to know? {this.state.answer}</h1>
                    <ChildComponent answer={this.state.answer}/>
                </div>
            )
        }
    }

    export default App

    ```

- kiv: changing states via `set_state` method. this method will update in your ancestors/offspring

```javascript
// App.js: putting the todos within the state
import React from "react";
import TodoItem from "./TodoItem";
import todosData from "./todosData";

class App extends React.Component {
  constructor() {
    super();
    this.state = {
      todos: todosData
    };
  }

  render() {
    const todoItems = this.state.todos.map(item => (
      <TodoItem key={item.id} item={item} />
    ));

    return <div className="todo-list">{todoItems}</div>;
  }
}

export default App;
```

### event handling

- [supported react events!](https://reactjs.org/docs/events.html#supported-events)

- similar to HTML event handling conventions, just that the React conventions(camelCasing) has to be followed

```javascript
import React from "react";
// https://reactjs.org/docs/events.html#supported-events
function App() {
  function handleClick() {
    console.log("I was clicked");
  }
  return (
    <div>
      <img src="https://www.fillmurray.com/200/100" />
      <br />
      <br />
      <button
        onClick={handleClick}
        onMouseOver={() => console.log("hovering!")}
      >
        Click me
      </button>
    </div>
  );
}

export default App;
```

- you can create a custom method for handling events e.g.

```javascript
handleClick(){
    // put code here
}
```

- rmb that you don't modify the current state, you're going to use `.setState` that takes in a JS object

- **you have to do a binding!** Anytime you want to define a class method that you want to use `.setState` on, you have to bind that method to your own class like so:

  - binding is done inside the constructor itself

  ```javascript
  class App extends React.Component {
      constructor() {
          super()
          this.state = {
              count: 0
          }
          this.handleClick = this.handleClick.bind(this)
      }

      handleClick() {
          //  setState: you can pass an object to set it to that object or a function that returns an object literal that is representing the new version of that state

          // passing in an object to setState:
          // this.setState({ count: 1 })
  ```


            this.setState(prevState => {
                return {count: prevState.count + 1} //returns an obj so in curly braces. not to be confused with JSX/JS
            })
        }

        render() {
            return (
                <div>
                    <h1>{this.state.count}</h1>
                    <button onClick={this.handleClick}>Change!</button>
                </div>
            )
        }
    }


    ```

todoapp example, with event handling:

```javascript
/**
 * Let's make it so our checkbox can actually mark our todo as complete or incomplete!
 * This challenge is a little more involved than some of the past ones. Check the comments
 * in the code for some help on accomplishing this one
 *
 * Challenge:
 * 1. Create an event handler in the App component for when the checkbox is clicked (which is an `onChange` event)
 *    a. This method will be the trickest part. Check the comments in the stubbed-out method below for some pseudocode to help guide you through this part
 * 2. Pass the method down to the TodoItem component
 * 3. In the TodoItem component, make it so when the `onChange` event happens, it calls the `handleChange` method and passes the id of the todo into the function
 */

// TodoItem.js
function TodoItem(props) {
  return (
    <div className="todo-item">
      <input
        type="checkbox"
        checked={props.item.completed}
        // we want id to be passed in as a param to handleChange method
        // but when events (onChange event here) are fired, they receive an event property, we we can't put {props.handleChange}
        // put it in a nullary function like so:
        onChange={event => props.handleChange(props.item.id)}
      />
      <p>{props.item.text}</p>
    </div>
  );
}

// App.js

//we are dealing with an entire array here (`todos` is an array) and at the same time, we don't want to destructively modify the previousState, hence we use a map function

import React from "react";
import TodoItem from "./TodoItem";
import todosData from "./todosData";

class App extends React.Component {
  constructor() {
    super();
    this.state = {
      todos: todosData
    };
    this.handleChange = this.handleChange.bind(this);
    // rmb to bind! because we want to use set_state method
  }

  handleChange(id) {
    // pass in a function that returns the new version of that object for set_state
    // the todos object is an array, but we don't want to destructively change it, hence use a const to keep the new version of that array
    // the return value of that lambda function here is the object itself so {todo: <new array>}
    this.setState(prevState => {
      const updatedTodos = prevState.todos.map(todo => {
        if (todo.id === id) {
          // return a brand new object that will replace that todo in the new array
          return {
            ...todo,
            completed: !todo.completed
          };
        }
        return todo; // this return is in the case that the if predicate doesn't match
      });
      return {
        todos: updatedTodos
      };
    });
  }

  render() {
    const todoItems = this.state.todos.map(item => (
      <TodoItem key={item.id} item={item} handleChange={this.handleChange} />
    ));

    return <div className="todo-list">{todoItems}</div>;
  }
}
```

[see interesting use of the **_object spread notation in the handleChange method above_** ](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)

## Lifecycle Methods

- [overview article](https://engineering.musefind.com/react-lifecycle-methods-how-and-when-to-use-them-2111a1b692b1) -[official react blogpost](https://reactjs.org/blog/2018/03/29/react-v-16-3.html#component-lifecycle-changes)
- [official react blog post on this](https://reactjs.org/blog/2018/03/29/react-v-16-3.html#component-lifecycle-changes)
- every component created during the application undergoes a series of events

- this just covers common lifecycle methods

  1. `render()` method (upon any change detected you may render something)
  2. `componentDidMount()`: very first time component shows up, this method runs.

     - gets the data needed to correctly display
     - only runs once. Rerenders don't run this method (rerenders don't unmount and remount)

     **_Use Case_**:

     - to do API calls, to get data from some kind of external source

  3. legacy code: `componentWillReceiveProps`, soon to be deprecated, just know its use to help understand legacy code:

  ```javascript
  componentWillReceiveProps(nextProps) {
          if (nextProps.whatever !== this.props.whatever) {
              // do something important here
          }
      }

  ```

  4. `shouldComponentUpdate()`

  - allows us to optimise app by specifying when said rerendering should actually happen

  ```javascript
  shouldComponentUpdate(nextProps, nextState) {
          // return true if want it to update
          // return false if not
      }

  ```

  5. `shouldComponentUnmount()`

     ```javascript
     componentWillUnmount() {
             // teardown or cleanup your code before your component disappears
             // (E.g. remove event listeners)
         }
     ```

  6. `static getDerivedStateFromProps(props, state)` <-- it's a static method!

     - not recommended to use, see more use cases [here](https://reactjs.org/docs/react-component.html#static-getderivedstatefromprops)
     - why [not recommended to use](https://reactjs.org/blog/2018/06/07/you-probably-dont-need-derived-state.html)

  7. `getSnapshotBeforeUpdate()`

  ```javascript
  getSnapshotBeforeUpdate() {
      // create a backup of the current way things are
      // https://reactjs.org/docs/react-component.html#getsnapshotbeforeupdate
  }

  ```


    8. `componentDidUpdate()`

    - does some logic whenever the component is updated
    - you'd probably use the `set_state` method, but you'd easily incur an infinite loop!
        - `componentDidUpdate` fires up whenever component is updated, changing state causes rerendering which fires up `componentDidUpdate` again
        - provide a condition to prevent this infinite loop

    ```javascript
     componentDidUpdate(prevProps, prevState) {
        if(prevState.count !== this.state.count) {
            const newColor = randomcolor()
            this.setState({color: newColor})
        }
    }
    ```

## Conditional Rendering

- e.g. use case: conditionally render component when API call is being made (like a loading screen)

- nb: it makes more sense to not put conditional as a separate component, and to put it within the App.js instead, but it's structured like this for brevity sake

  ```javascript
  // Conditional.js
  import React from "react";

  function Conditional(props) {
    if (props.isLoading === true) {
      return <h1>Loading...</h1>;
    }
    return <h1>Some cool stuff about conditional rendering</h1>;
  }
  // using the ternary operator(take note of how the JSX/Js is wrapped)
  function Conditional(props) {
    return (
      <div>
        props.isLoading ? <h1>Loading...</h1> :{" "}
        <h1>Some cool stuff about conditional rendering</h1>
      </div>
    );
  }

  export default Conditional;

  // App.js
  import React, { Component } from "react";
  import Conditional from "./Conditional";

  class App extends Component {
    constructor() {
      super();
      this.state = {
        isLoading: true
      };
    }

    // this setting of timeout is just to simulate/imitate the timeout while loading of an API.
    componentDidMount() {
      setTimeout(() => {
        this.setState({
          isLoading: false
        });
      }, 1500);
    }

    render() {
      return (
        <div>
          <Conditional isLoading={this.state.isLoading} />
        </div>
      );
    }
  }

  export default App;
  ```

* the logical `&&` operator is useful here.

  - underlying JS works like so :
    `true && false`, returns false expression
    `false && false`, returns first false expression

  - so, `&&` operator can be a way to conditionally render something if a condition is true or render nothing if it's false

  ```javascript
  class App extends Component {
    constructor() {
      super();
      this.state = {
        unreadMessages: ["a", "b"]
      };
    }
    render() {
      return (
        <div>
          {this.state.unreadMessages.length > 0 && (
            <h2>
              You have {this.state.unreadMessages.length} unread messages!
            </h2>
          )}
        </div>
      );
    }
  }
  ```

* the `&&` part equivalent to using ternary, but this style is pretty common apparently

* an example, read this:

  ```javascript
  class App extends React.Component {
    constructor() {
      super();
      this.state = {
        isLoggedIn: false
      };
      this.handleClick = this.handleClick.bind(this);
    }

    handleClick() {
      this.setState(prevState => {
        return {
          isLoggedIn: !prevState.isLoggedIn
        };
      });
    }

    render() {
      let buttonText = this.state.isLoggedIn ? "LOG OUT" : "LOG IN";
      let displayText = this.state.isLoggedIn ? "Logged in" : "Logged out";
      return (
        <div>
          <button onClick={this.handleClick}>{buttonText}</button>
          <h1>{displayText}</h1>
        </div>
      );
    }
  }

  export default App;
  ```

- adding some styling to the `TodoItem.js` using conditional rendering
  notice how the paragraph opening tag has a style component and that is conditionally rendered:
  `style={props.item.completed ? completedStyle : null}` the null just sets the value of the style to be null, i.e. no styling to be applied

  ```javascript
  function TodoItem(props) {
    const completedStyle = {
      fontStyle: "italic",
      color: "#cdcdcd",
      textDecoration: "line-through"
    };

    return (
      <div className="todo-item">
        <input
          type="checkbox"
          checked={props.item.completed}
          onChange={() => props.handleChange(props.item.id)}
        />
        <p style={props.item.completed ? completedStyle : null}>
          {props.item.text}
        </p>
      </div>
    );
  }
  ```

## Fetching Data from and API

- recap: `componentDidMount` runs it's code after the component finished **mounting to the DOM**

- tools for fetching API data:
  - [fetch](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch) : built in JS tool to handle HTTP requests
  - some API (hopefully CORS enabled)
  - [promises](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-promise-27fc71e77261)


    ```javascript
        componentDidMount() {
            this.setState({loading: true})
            fetch("https://swapi.co/api/people/1")
                .then(response => response.json())
                .then(data => {
                    this.setState({
                        loading: false,
                        character: data
                    })
                })
        }

        render() {
            const text = this.state.loading ? "loading..." : this.state.character.name
            return (
                <div>
                    <p>{text}</p>
                </div>
            )
        }

    ```

- **NB:** the `.then` is to chain up processes sequentially for a particular promise

## [React Forms](https://reactjs.org/docs/forms.html)

- [**_Consider using Formik to help you build forms_**](https://jaredpalmer.com/formik/docs/overview)

- understanding state is impt
- react forms are a little different from other DOM elements in react:
  - naturally keep some internal state
  - constantly keeps track of all the info and state (w every keystroke) instead of the usual HTML way where it's handled upon submitting
  -

### Controlled Components

- In HTML, form elements maintain their own state and update it based on user input
  but in React, sate is kept in the **state property** of compnents and is updated with the `setState()` method

- by making React be the **_"single source of truth"_**,
  React component that renders a form, also controls what happens in that form on
  subsequent user input.
  **_An input form element whose value is controlled by React in this way is called a "controlled component"_**.

  Idea:

  - what is displayed in our form should perfectly match up with our state, instead of our state just being **reactive**
  - state directs what is inside of the input box
  - basically adding a value property
  - **_you need to write an event handler for every way your data can change and pipe all of the input state through a React component._**

- best practice: pull your `name` and `value` out using constants and then use `setState` to make things clearer and avoid some bug

  ```javascript
  handleChange(event) {
        const {name, value, type, checked} = event.target
        type === "checkbox" ? this.setState({ [name]: checked }) : this.setState({ [name]: value })
    }
  ```

```javascript
class NameForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { value: "" };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ value: event.target.value });
  }

  handleSubmit(event) {
    alert("A name was submitted: " + this.state.value);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Name:
          <input
            type="text"
            value={this.state.value}
            onChange={this.handleChange}
          />
        </label>
        <input type="submit" value="Submit" />
      </form>
    );
  }
}
```

- `target` represents the element in which the event was found

#### textarea Tag

- HTML: `<textarea>` element defines its text by its children but in React, `<textarea>` uses a `value` attribute instead.
- react textarea is self-closing

#### input type

##### checkboxes

- from `input` tag
- maintains **booleans** in state
  - uses checked property instead of value because it only holds bool value

##### radio butttons

- a mix of both input types text and checkboxes:
  - has both value and checked property

#### select Tag

- creates a dropdown list of `options`
- setting a value in the state of the form is how you pre-select an option. The value should reflect what the state should be if the option is chosen
  like so:
- value of the select box reflectst the chosen option e.g. `value={this.state.<state property>}`

```javascript
class FlavorForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { value: "coconut" };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ value: event.target.value });
  }

  handleSubmit(event) {
    alert("Your favorite flavor is: " + this.state.value);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Pick your favorite flavor:
          <select value={this.state.value} onChange={this.handleChange}>
            <option value="grapefruit">Grapefruit</option>
            <option value="lime">Lime</option>
            <option value="coconut">Coconut</option>
            <option value="mango">Mango</option>
          </select>
        </label>
        <input type="submit" value="Submit" />
      </form>
    );
  }
}
```

#### file input Tag

- allows users to input a file of choice
- it's read only, hence it's an uncontrolled component

### Handling Multiple Inputs

- essentially, your `handleInputChange()` is written such that you look at the type of the target
  and decide the name and value accordingly. Then you `setState` using the controlled `name` and `value`

  ```javascript
  class Reservation extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        isGoing: true,
        numberOfGuests: 2
      };

      this.handleInputChange = this.handleInputChange.bind(this);
    }

    handleInputChange(event) {
      const target = event.target;
      const value = target.type === "checkbox" ? target.checked : target.value;
      const name = target.name;

      this.setState({
        [name]: value
      });
    }

    render() {
      return (
        <form>
          <label>
            Is going:
            <input
              name="isGoing"
              type="checkbox"
              checked={this.state.isGoing}
              onChange={this.handleInputChange}
            />
          </label>
          <br />
          <label>
            Number of guests:
            <input
              name="numberOfGuests"
              type="number"
              value={this.state.numberOfGuests}
              onChange={this.handleInputChange}
            />
          </label>
        </form>
      );
    }
  }
  ```

### Submissions

- just put an `onSubmit` handler to the form

example of a booking form:

```JSX
import React, { Component } from "react";

/**
 * Challenge: Wire up the partially-finished travel form so that it works!
 * Remember to use the concept of controlled forms
 * https://reactjs.org/docs/forms.html
 *
 * All information should be populating the text below the form in real-time
 * as you're filling it out
 *
 * This exercise is adapted from the V School curriculum on vanilla JS forms:
 * https://coursework.vschool.io/travel-form/
 *
 * All of our challenges and learning resources are open for the public
 * to play around with and learn from at https://coursework.vschool.io
 */

class App extends Component {
  constructor() {
    super();
    this.state = {
      firstName: "",
      lastName: "",
      age: "",
      gender: "",
      destination: "",
      isVegan: false,
      isKosher: false,
      isLactoseFree: false
    };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    const { name, value, type, checked } = event.target;
    type === "checkbox"
      ? this.setState({
          [name]: checked
        })
      : this.setState({
          [name]: value
        });
  }

  render() {
    return (
      <main>
        <form>
          <input
            name="firstName"
            value={this.state.firstName}
            onChange={this.handleChange}
            placeholder="First Name"
          />
          <br />

          <input
            name="lastName"
            value={this.state.lastName}
            onChange={this.handleChange}
            placeholder="Last Name"
          />
          <br />

          <input
            name="age"
            value={this.state.age}
            onChange={this.handleChange}
            placeholder="Age"
          />
          <br />

          <label>
            <input
              type="radio"
              name="gender"
              value="male"
              checked={this.state.gender === "male"}
              onChange={this.handleChange}
            />{" "}
            Male
          </label>

          <br />

          <label>
            <input
              type="radio"
              name="gender"
              value="female"
              checked={this.state.gender === "female"}
              onChange={this.handleChange}
            />{" "}
            Female
          </label>

          <br />

          <select
            value={this.state.destination}
            name="destination"
            onChange={this.handleChange}
          >
            <option value="">-- Please Choose a destination --</option>
            <option value="germany">Germany</option>
            <option value="norway">Norway</option>
            <option value="north pole">North Pole</option>
            <option value="south pole">South Pole</option>
          </select>

          <br />

          <label>
            <input
              type="checkbox"
              name="isVegan"
              onChange={this.handleChange}
              checked={this.state.isVegan}
            />{" "}
            Vegan?
          </label>
          <br />

          <label>
            <input
              type="checkbox"
              name="isKosher"
              onChange={this.handleChange}
              checked={this.state.isKosher}
            />{" "}
            Kosher?
          </label>
          <br />

          <label>
            <input
              type="checkbox"
              name="isLactoseFree"
              onChange={this.handleChange}
              checked={this.state.isLactoseFree}
            />{" "}
            Lactose Free?
          </label>
          <br />

          <button>Submit</button>
        </form>
        <hr />
        <h2>Entered information:</h2>
        <p>
          Your name: {this.state.firstName} {this.state.lastName}
        </p>
        <p>Your age: {this.state.age}</p>
        <p>Your gender: {this.state.gender}</p>
        <p>Your destination: {this.state.destination}</p>
        <p>Your dietary restrictions:</p>

        <p>Vegan: {this.state.isVegan ? "Yes" : "No"}</p>
        <p>Kosher: {this.state.isKosher ? "Yes" : "No"}</p>
        <p>Lactose Free: {this.state.isLactoseFree ? "Yes" : "No"}</p>
      </main>
    );
  }
}

export default App;
```

## [React Container & Component Architecture: separation of concerns](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0)

- idea is to prevent scrolling as much as possible.
- separate the UI logic (presentational component/dumb) and Business logic(smart component)

```jsx
// FromContainer.js : handles the business logic
import React, { Component } from "react";
import FormComponent from "./FormComponent";

class Form extends Component {
  constructor() {
    super();
    this.state = {
      firstName: "",
      lastName: "",
      age: "",
      gender: "",
      destination: "",
      isVegan: false,
      isKosher: false,
      isLactoseFree: false
    };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    const { name, value, type, checked } = event.target;
    type === "checkbox"
      ? this.setState({
          [name]: checked
        })
      : this.setState({
          [name]: value
        });
  }

  render() {
    return <FormComponent handleChange={this.handleChange} data={this.state} />;
  }
}

export default Form;

// FormComponent.js : handles the presentational logic
import React from "react";

function FormComponent(props) {
  return (
    <main>
      <form>
        <input
          name="firstName"
          value={props.data.firstName}
          onChange={props.handleChange}
          placeholder="First Name"
        />
        <br />

        <input
          name="lastName"
          value={props.data.lastName}
          onChange={props.handleChange}
          placeholder="Last Name"
        />
        <br />

        <input
          name="age"
          value={props.data.age}
          onChange={props.handleChange}
          placeholder="Age"
        />
        <br />

        <label>
          <input
            type="radio"
            name="gender"
            value="male"
            checked={props.data.gender === "male"}
            onChange={props.handleChange}
          />{" "}
          Male
        </label>

        <br />

        <label>
          <input
            type="radio"
            name="gender"
            value="female"
            checked={props.data.gender === "female"}
            onChange={props.handleChange}
          />{" "}
          Female
        </label>

        <br />

        <select
          value={props.data.destination}
          name="destination"
          onChange={props.handleChange}
        >
          <option value="">-- Please Choose a destination --</option>
          <option value="germany">Germany</option>
          <option value="norway">Norway</option>
          <option value="north pole">North Pole</option>
          <option value="south pole">South Pole</option>
        </select>

        <br />

        <label>
          <input
            type="checkbox"
            name="isVegan"
            onChange={props.handleChange}
            checked={props.data.isVegan}
          />{" "}
          Vegan?
        </label>
        <br />

        <label>
          <input
            type="checkbox"
            name="isKosher"
            onChange={props.handleChange}
            checked={props.data.isKosher}
          />{" "}
          Kosher?
        </label>
        <br />

        <label>
          <input
            type="checkbox"
            name="isLactoseFree"
            onChange={props.handleChange}
            checked={props.data.isLactoseFree}
          />{" "}
          Lactose Free?
        </label>
        <br />

        <button>Submit</button>
      </form>
      <hr />
      <h2>Entered information:</h2>
      <p>
        Your name: {props.data.firstName} {props.data.lastName}
      </p>
      <p>Your age: {props.data.age}</p>
      <p>Your gender: {props.data.gender}</p>
      <p>Your destination: {props.data.destination}</p>
      <p>Your dietary restrictions:</p>

      <p>Vegan: {props.data.isVegan ? "Yes" : "No"}</p>
      <p>Kosher: {props.data.isKosher ? "Yes" : "No"}</p>
      <p>Lactose Free: {props.data.isLactoseFree ? "Yes" : "No"}</p>
    </main>
  );
}

export default FormComponent;

// App.js: just combines the two
import React, { Component } from "react";
import Form from "./FormContainer";

function App() {
  return <Form />;
}

export default App;
```



## Modern React: 

 Other modern/advanced React features/topics to learn:
 [Official React Context API](https://reactjs.org/docs/context.html)

 [Error Boundaries](https://reactjs.org/docs/error-boundaries.html)

 [render props](https://reactjs.org/docs/render-props.html)
 [Higher Order Components](https://reactjs.org/docs/higher-order-components.html)

 [React Router](https://reacttraining.com/react-router/core/guides/philosophy)

 [React Hooks](https://reactjs.org/docs/hooks-intro.html)

 [React lazy, memo, and Suspense](https://reactjs.org/blog/2018/10/23/react-v-16-6.html)
  



## Hooks

- using functional components to "hook into" state and lifecycle methods of components instead of using classes
- improve readability and organisation of components


### `useState()` hook
- useState is within the react library, can choose to pull it in specifically as a named import if you want
  - useState() -> returns an array. Because we are expected to do ***array destructuring*** to obtaining the desired value we want
    - first param is initial state value 
    - second param is a function that allows us to change the state
- State using a class component: 

  ```jsx
  import React from "react"

  class App extends React.Component {
      constructor() {
          super()
          this.state = {
              answer: "Yes"
          }
      }
      
      render() {
          return (
              <div>
                  <h1>Is state important to know? {this.state.answer}</h1>
              </div>
          )
      }
  }

  export default App
  ```

  Converting to functional component using `useState` hook:


  ```javascript
  import React, {useState} from "react"

  function App() {
      const [answer] = useState("Yes")
      return (
          <div>
              <h1>Is state important to know? {answer}</h1>
          </div>
      )
  }

  ```


  ```javascript
  function App() {
      const [count, setCount] = useState(0)
      
      function increment() {
          setCount(prevCount => prevCount + 1)
      }
      
      function decrement() {
          setCount(prevCount => prevCount - 1)
      }
      
      return (
          <div>
              <h1>{count}</h1>
              <button onClick={increment}>Increment</button>
              <button onClick={decrement}>Decrement</button>
              
          </div>
      )
  }
  ```



### `useEffect()` hooking onto lifecycle methods from a functional component 

- handles side effects of your components 
 - example of side-effects:  
    - Network request
    - Manual DOM manipulation
    - Event listeners or timeouts and intervals