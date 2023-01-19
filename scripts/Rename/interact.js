const ethers = require("ethers")

const RENAME_CONTRACT_ARTIFACT_PATH = process.env.RENAME_CONTRACT_ARTIFACT_PATH
const RENAME_CONTRACT_ADDRESS = process.env.RENAME_CONTRACT_ADDRESS

const ACC_A_ADDR = process.env.ACC_A_ADDR
const ACC_A_PKEY = process.env.ACC_A_PKEY

const ACC_B_ADDR = process.env.ACC_B_ADDR
const ACC_B_PKEY = process.env.ACC_B_PKEY

const provider = new ethers.providers.JsonRpcProvider()
const signer = new ethers.Wallet(ACC_A_PKEY, provider)

const Contract = require(RENAME_CONTRACT_ARTIFACT_PATH)
const contract = new ethers.Contract(RENAME_CONTRACT_ADDRESS, Contract.abi, signer)

async function main() {
  await contract.callAPI()
}

main()
