const repeatString = function (str, times) {

    if (times >= 0) {
        let res = "";
        for (let i = 0; i < times; i++) {
            res += str;
        }
        return res;
    } else {
        return "ERROR";
    }

}

module.exports = repeatString
