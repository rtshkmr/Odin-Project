const getTheTitles = function(books) {
    let res = [];
    for(let i = 0; i < books.length; i ++){
        res[i] = books[i].title;
    }
    return res;
}

module.exports = getTheTitles;
