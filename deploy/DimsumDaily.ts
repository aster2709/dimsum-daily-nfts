import { ethers } from "hardhat";
import { DeployFunction } from "hardhat-deploy/types";

const func: DeployFunction = async (hre): Promise<void> => {
  const { deployer } = await hre.getNamedAccounts();
  await hre.deployments.deploy("DimsumDaily", {
    from: deployer,
    log: true,
    args: [ethers.utils.parseEther("0.08"), "some-uri"],
  });
};

export default func;
func.tags = ["DimsumDaily"];
