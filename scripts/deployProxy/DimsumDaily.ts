import { ethers, upgrades } from "hardhat";

const deployProxy = async () => {
    const dds_factory = await ethers.getContractFactory("DimsumDaily");
    const dds_proxy = await upgrades.deployProxy(dds_factory, [
        ethers.utils.parseEther("1"), // initial price
        "https://my-json-server.typicode.com/aster2709/json-server/tokens/", // base uri
    ]);
    console.log("proxy deploy at", dds_proxy.address);
};

void deployProxy();
