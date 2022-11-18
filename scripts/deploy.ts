import { ethers } from "hardhat";

async function main() {
  const Contract = await ethers.getContractFactory("Factory");
  const contract = await Contract.deploy(
    '0xabF8d76c911aA49d1484321aD1fC8090362cfd6C'
  );

  await contract.deployed();

  console.log("Factory deployed to:", contract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
