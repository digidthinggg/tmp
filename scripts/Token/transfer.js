const ethers = require("ethers")

const TOKEN_CONTRACT_ARTIFACT_PATH = process.env.TOKEN_CONTRACT_ARTIFACT_PATH
const TOKEN_CONTRACT_ADDRESS = process.env.TOKEN_CONTRACT_ADDRESS

const ACC_A_ADDR = process.env.ACC_A_ADDR
const ACC_A_PKEY = process.env.ACC_A_PKEY

const ACC_B_ADDR = process.env.ACC_B_ADDR
const ACC_B_PKEY = process.env.ACC_B_PKEY

const provider = new ethers.providers.JsonRpcProvider()
const signer = new ethers.Wallet(ACC_A_PKEY, provider)

const Contract = require(TOKEN_CONTRACT_ARTIFACT_PATH)
const contract = new ethers.Contract(TOKEN_CONTRACT_ADDRESS, Contract.abi, signer)

const TRANSFER_AMOUNT = 1

const transferFromAToB = Math.random() < 0.5

async function main() {
  let totalSupply = await contract.getTotalSupply()
  let totalSupplyStr = ethers.utils.formatEther(totalSupply)
  console.log(">>> totalSupply:", totalSupplyStr)

  await contract.publicMint()

  totalSupply = await contract.getTotalSupply()
  totalSupplyStr = ethers.utils.formatEther(totalSupply)
  console.log(">>> totalSupply:", totalSupplyStr)

  await contract.publicBurn()

  totalSupply = await contract.getTotalSupply()
  totalSupplyStr = ethers.utils.formatEther(totalSupply)
  console.log(">>> totalSupply:", totalSupplyStr)

  /*
  if (transferFromAToB) {
    console.log(">>> Transfering from A to B")
    await contract.transferFrom(ACC_A_ADDR, ACC_B_ADDR, TRANSFER_AMOUNT)
  } else {
    console.log(">>> Transfering from B to A")
    await contract.transferFrom(ACC_B_ADDR, ACC_A_ADDR, TRANSFER_AMOUNT)
  }
  */

}

main()

contract.on("TransferPending", () => {
  console.log("EVENT: TransferPending")
})

contract.on("TransferSuccess", () => {
  console.log("EVENT: TransferSuccess")
})

contract.on("TransferFailure", () => {
  console.log("EVENT: TransferFailure")
})
