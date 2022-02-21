
const Loopy = artifacts.require("Loopy");

const tokenName = "Loopy";
const symbol = "LP"; 
const decimal= 18;  
const totalSupply= "1000000000000000000000000"; 

module.exports = function (deployer) {
  deployer.deploy(Loopy, tokenName, symbol, decimal, totalSupply);
};

