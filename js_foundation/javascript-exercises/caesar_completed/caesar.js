/*
On hindsight,
can be made shorted using map method on the array instead of using for loops!
*/

const caesar = function (str, shiftValue) {
    // preprocess: convert everything to ascii character codes:
    let inputAscii = [];
    for (let i = 0; i < str.length; i++) {
        inputAscii[i] = str.charCodeAt(i);
    }
    // only change letters, so condition being within certain value range
    // uppercase: b/w 65 to 90 inclusive 
    // lowercase: b/w 97 to 122 inclusive
    const shift = (step, initial) => {

        //wrap helper function:
        function wrap(lower, upper) {
            const modded = step % 26; //to handle large shift factors
            let value = initial + modded;
            if (value < lower) {
                value = (upper + 1) - (lower - (value));
            } else if (value > upper) {
                value = (value % upper) + (lower - 1);
            } else { }; // do nothing if value within range
            return value;
        }

        if (initial >= 65 && initial <= 90) {
            // lowercase letters:
            return wrap(65, 90);
        } else if ((initial >= 97 && initial <= 122)) {
            // uppercase letters:
            return wrap(97, 122);
        } else {
            // non-letters, leave as is
            return initial;
        }
    }
    const convertToChar = (asciiCode) => String.fromCharCode(asciiCode);
    let shiftedAsciiArr = [];
    for (let i = 0; i < inputAscii.length; i++) {
        shiftedAsciiArr[i] = shift(shiftValue, inputAscii[i]);
    }
    let resString = [];
    for (let i = 0; i < str.length; i++) {
        resString[i] = convertToChar(shiftedAsciiArr[i]);
    }
    return resString.join("");
}


module.exports = caesar
