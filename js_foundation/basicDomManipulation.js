// reference to the content class
const content = document.querySelector(".content");

// adding elements, pretty standard "flow":

// red paragraph
const  para = document.createElement("p");
para.classList.add("para"); // adds the class "para" to the <p> 
para.textContent = "Hey I’m red!";
para.style.cssText = "color : red";
content.appendChild(para);

// add h3 saying I'm a blue h3: 
const blueHeading = document.createElement("h3");
// blueHeading.classList.add("blue");
blueHeading.textContent = "I'm a blue h3";
blueHeading.style.cssText = "color : blue";
content.appendChild(blueHeading);

// a div with black border and pink bkgd color with some elements nested within:
const div = document.createElement('div');
div.style.backgroundColor = "pink";
div.style.border = "solid";
div.style.borderColor = "black";
content.appendChild(div); 
// not necessary to append this at the end.


// create elems to be nested, then add to classList of div
const innerHeading = document.createElement('h1');
const innerPara = document.createElement('p');
innerHeading.textContent = "I'm in a div";
innerPara.textContent = "ME TOO!";
div.appendChild(innerHeading);
div.appendChild(innerPara);





//adding button second method: 
let secondButton = document.querySelector('#btn2');
secondButton.onClick = () => alert("HEllo world, method 2 clicked on!");

// //adding button third method:
let thirdButton = document.querySelector("#btn3");
thirdButton.addEventListener("click", (e) => {
    // e.target.style.background = "blue";
    e.target.style.borderStyle = "dashed";
    e.target.style.borderColor = "black";
    secondButton.style.backgroundColor = "green";
    div.style.backgroundColor = "yellow";
    alert("Hello World, I be the third button");
});


// using a nodelist:
const buttons = document.querySelectorAll('button');

// using .forEach
buttons.forEach((button) => {
    // each button, add a 'click' listener:
    button.addEventListener("click", (e) => {
        button.style.backgroundColor = "red";
    });
});







