const CONTRACT_NAME = process.env.RENAME_CONTRACT_NAME

async function main() {
  const Rename = await ethers.getContractFactory(CONTRACT_NAME)
  const rename = await Rename.deploy()

  console.log("Rename deployed to address:", rename.address)
}

main().catch(error => {
  console.log(error)
  process.exitCode = 1
})
