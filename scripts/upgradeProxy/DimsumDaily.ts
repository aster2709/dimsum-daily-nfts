import { ethers, upgrades } from "hardhat";

const proxyAddress = "";

const deployProxy = async () => {
    if (!proxyAddress) throw new Error("please input proxy address to upgrade");
    const dds_factory = await ethers.getContractFactory("DimsumDaily");
    const dds_proxy = await upgrades.upgradeProxy(proxyAddress, dds_factory);
    console.log("proxy upgraded at", dds_proxy.address);
};

void deployProxy();
