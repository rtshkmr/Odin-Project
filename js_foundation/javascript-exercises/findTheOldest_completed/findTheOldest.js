let findTheOldest = function (people) {
    let today = new Date();
    const getAge = person => {
        if (person.yearOfDeath === undefined) {
            // alive, calc age from birth till now:
            return today.getFullYear() - person.yearOfBirth;
        } else {
            // dead, calc age from death till birth:
            return person.yearOfDeath - person.yearOfBirth;
        }
    }
    return people.reduce((person, oldestPersonYet) => getAge(person) > getAge(oldestPersonYet)
        ? person
        : oldestPersonYet)
}




module.exports = findTheOldest
