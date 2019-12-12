const ftoc = function(x) {

  const res = ((x - 32) * (5 / 9));
  return Number.isInteger(res) ? res : +(res.toFixed(1));
}

const ctof = function(x) {
  const res = (x * (9 / 5) + 32);
  return Number.isInteger(res) ? res : +(res.toFixed(1));
  
}

module.exports = {
  ftoc,
  ctof
}
