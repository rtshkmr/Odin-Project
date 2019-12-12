const leapYears = function(year) {
    // div by 4 but not 100 
    const century = x => x % 100 === 0;
    const four = x => x % 4 === 0;
    const fourhundred = x => x % 400 === 0;
    return !century(year) 
                ? four(year)
                : fourhundred(year);
            
}

module.exports = leapYears
