const CONTRACT_NAME = process.env.TOKEN_CONTRACT_NAME

async function main() {
  const Token = await ethers.getContractFactory(CONTRACT_NAME)
  const token = await Token.deploy()

  console.log("Token deployed to address:", token.address)
}

main().catch(error => {
  console.log(error)
  process.exitCode = 1
})
