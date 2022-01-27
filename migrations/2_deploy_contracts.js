const Hari = artifacts.require('Hari')

module.exports = async function (delpoyer){
    await delpoyer.deploy(Hari)
}