const HARI = artifacts.require("HARI");

const tokenName = "HARI";
const symbol = "HRI"; 
const decimal= 18;  
const totalSupply= "100000000000000000000000000"; 

module.exports = function (deployer) {
  deployer.deploy(HARI, tokenName, symbol, decimal, totalSupply);
};

