//const RealEstateFactory = artifacts.require("");
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("RealEstateFactory", function () {
  it("Create a house", async function () {
    const [owner] = await ethers.getSigners();

    const RealEstateFactory = await ethers.getContractFactory("RealEstateFactory");

    const RealEstateFactoryContract = await RealEstateFactory.deploy();

    const RealEstateProvider = await RealEstateFactoryContract.connect(owner);

    const RealEstate = await RealEstateProvider.functions.createRealEstate("House", "242 rue du Faubourg Saint Antoine", "Ma maison a esgi", 1, 30, 1242145);

    const res = await RealEstateProvider.functions.realEstates(0);
    console.log(res.typeEstate);
    expect(res.typeEstate).to.equal("House");

    //await RealEstateProvider.functions.buyRealEstate(0);
    //console.log("deuxieme test");
    //const res2 = await RealEstateProvider.functions.realEstates(0);
    //console.log(res2);
    //expect(res2).to.equal(none);

  });
});
