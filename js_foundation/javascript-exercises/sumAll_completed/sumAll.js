const sumAll = function(x, y) {
    if(x < 0 || y < 0 || typeof(x) !== "number" || typeof(y) !== "number"){
        return "ERROR";
    } else{
        let res = 0;
        if(x < y){
            for(let i = x; i < y + 1; i++){
                res += i;
            }
            return res;
        } else{
            return sumAll(y, x);
        }
    }
}

module.exports = sumAll
