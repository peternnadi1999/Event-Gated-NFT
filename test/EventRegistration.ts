import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import hre from "hardhat";

describe("Lock", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployLagosConferenceNFTLockFixture() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await hre.ethers.getSigners();

    const Nft = await hre.ethers.getContractFactory("LagosConferenceNFT");
    const nft = await Nft.deploy();

    return { nft, owner, otherAccount };
  }
  async function deployEventRegistrationLockFixture() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await hre.ethers.getSigners();

    const Event = await hre.ethers.getContractFactory("EventRegistration");
    const event = await Event.deploy();

    return { event, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Should set the right unlockTime", async function () {
      const {  event, owner,  } = await loadFixture(deployEventRegistrationLockFixture);

    });

  });

  describe("Withdrawals", function () {
   
    });

});
