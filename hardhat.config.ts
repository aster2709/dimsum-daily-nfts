import "dotenv/config";
import "@typechain/hardhat";
import "@nomiclabs/hardhat-waffle";
import "@openzeppelin/hardhat-upgrades";
import "@nomiclabs/hardhat-etherscan";
import "hardhat-gas-reporter";
import { HardhatUserConfig } from "hardhat/types";

if (!process.env.DEPLOYER_PRIVATE_KEY) {
    throw new Error("please input private key of deployer in .env file");
}

const config: HardhatUserConfig = {
    solidity: "0.8.13",
    networks: {
        rinkeby: {
            url: process.env.RPC,
            accounts: [process.env.DEPLOYER_PRIVATE_KEY],
        },
    },
    etherscan: {
        apiKey: process.env.EXPLORER_API_KEY,
    },
};

export default config;
