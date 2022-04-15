//const RealEstateFactory = artifacts.require("");
const { expect } = require("../contracts/RealEstateFactory.sol");

describe("RealEstateFactory", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("RealEstateFactory");

    const hardhatToken = await Token.deploy();

    const RealEstateProvider = await hardhatToken.connect(owner);

    const RealEstate = await RealEstateProvider.functions.createRealEstate("House", "242 rue du Faubourg Saint Antoine", "Ma maison a esgi", 1, 30, 1, 1242145);

    expect(RealEstate.typeEstate).to.equal("House");
  });
});
