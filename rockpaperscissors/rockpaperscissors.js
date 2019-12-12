const array = ["ROCK", "PAPER", "SCISSORS"];
// 0 beats 2, 1 beats 0, 2 beats 1

function computerPlay() {
    //chose random num b/w 1 to 3 inclusive
    return Math.floor(3 * Math.random());
}
let over = false; // bool flag
let counter = 0;
function playRound(playerSelection, computerSelection) {
    if (playerSelection !== computerSelection) {
        if ((playerSelection == 0 && computerSelection == 2) ||
            (playerSelection == 1 && computerSelection == 0) ||
            (playerSelection == 2 && computerSelection == 1)) {
            counter ++;
            return resultDisplay.textContent = "You Win! " + array[playerSelection] + " beats " + array[computerSelection];
        } else {
            counter --;
            return resultDisplay.textContent = "You Lose! " + array[computerSelection] + " beats " + array[playerSelection];
        }
    } else {
        console.log("It's a draw, both chose " + array[playerSelection]);
        return resultDisplay.textContent = "It's a draw, both chose " + array[playerSelection];
    }
}
function game() {
    let playerWins = 0;
    for (let i = 0; i < 5 && (playerWins > -3 && playerWins < 3); i++) {
        const char = playRound(
            prompt("choose rock, paper or scissors!"), computerPlay()).charAt(4);
        console.log(char);
        if (char === "W") {
            playerWins++;
        } else if (char === "L") {
            playerWins--;
        } else {
        }
    }
    if (playerWins > 0) {
        return "Congrats, you won the game, with number of successful rounds = " + playerWins + " times";
    } else if (playerWins < 0) {
        return "Not a good day today, lost, with number of successful rounds  " + playerWins + " times";
    } else {
        return "it's a draw";
    }
}
// Create DOM Objects:
// displays:
let pointDisplay = document.querySelector(".pointsCount");
let resultDisplay = document.querySelector(".display");
let winnerDisplay = document.querySelector('.finalWinner');
// buttons:
let resetButton = document.querySelector(".reset");
let rockButton = document.querySelector("#rock");
let paperButton = document.querySelector("#paper");
let scissorButton = document.querySelector("#scissor");
let buttons = document.querySelectorAll('button');

resetButton.addEventListener('mouseover', () => {
    counter = 0;
});
buttons.forEach( butt => {
    butt.addEventListener('click', (e) => playOnClick(e));

}); 


function playOnClick(e){
    if(!over){
        const comp = computerPlay();
        const player = array.indexOf(e.target.id.toUpperCase());
        playRound(player, comp);
        pointDisplay.textContent = counter;
        if(counter < -4){
            over = true;
            winnerDisplay.textContent = "Game Over! The winner is: COMPUTER"; 
        } else if (counter > 4){
            over = true;
            winnerDisplay.textContent = "Game Over! The winner is: HUMAN"; 
        }
    } else {
        resultDisplay.textContent = "Do you want to play again? Reset if you want";

    }

}

