const SupplyChain = artifacts.require("SupplyChain");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("SupplyChain", function (/* accounts */) {
  it("should create a Participant", async () => {
    let instance = await SupplyChain.deployed();
    await instance.addParticipant(
      "A",
      "passA",
      "0x95268AC2Ae50E1f96da67cBE8b5bd5b4Ca898e81",
      "Manufacturer"
    );
    let participant = await instance.participants(0);
    assert.equal(participant[0], "A");
    assert.equal(participant[2], "Manufacturer");

    await instance.addParticipant(
      "B",
      "passB",
      "0x153BbcDEDcaF3362BC7BCDabA62Defd6A3Fbf186",
      "Supplier"
    );
    participant = await instance.participants(1);
    assert.equal(participant[0], "B");
    assert.equal(participant[2], "Supplier");

    await instance.addParticipant(
      "C",
      "passC",
      "0xaA40130a7AAb82F93e513b66F0115120e0590f3c",
      "Consumer"
    );
    participant = await instance.participants(2);
    assert.equal(participant[0], "C");
    assert.equal(participant[2], "Consumer");
  });
  it("should return Participant details", async () => {
    const instance = await SupplyChain.deployed();
    let participantDetails = await instance.getParticipant(0);
    assert.equal(participantDetails[0], "A");

    participantDetails = await instance.getParticipant(1);
    assert.equal(participantDetails[0], "B");

    participantDetails = await instance.getParticipant(2);
    assert.equal(participantDetails[0], "C");
  });
});
