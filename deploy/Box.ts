import { DeployFunction } from "hardhat-deploy/types";

const func: DeployFunction = async (hre): Promise<void> => {
  const { deployer } = await hre.getNamedAccounts();
  await hre.deployments.deploy("Box", {
    from: deployer,
    log: true,
    proxy: {
      execute: {
        methodName: "initialize",
        args: [42],
      },
    },
  });
};

export default func;
func.tags = ["Box"];
