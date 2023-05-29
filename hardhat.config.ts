import "@matterlabs/hardhat-zksync-deploy";
import "@matterlabs/hardhat-zksync-solc";
import "@matterlabs/hardhat-zksync-verify";

module.exports = {
  zksolc: {
    version: "1.3.10",
    compilerSource: "binary",
    settings: {},
  },
  defaultNetwork: "zkSyncTestnet",

  networks: {
    goerli: {
      url: "https://eth-goerli.g.alchemy.com/v2/OzHFhsX9WV-iTXdbHlRmMp65bCTHc0DM" // The Ethereum Web3 RPC URL (optional).
    },
    zkSyncTestnet: {
      url: "https://testnet.era.zksync.dev",
      ethNetwork: "https://eth-goerli.g.alchemy.com/v2/OzHFhsX9WV-iTXdbHlRmMp65bCTHc0DM", // RPC URL of the network (e.g. `https://goerli.infura.io/v3/<API_KEY>`)
      zksync: true,
      verifyURL: "https://zksync2-testnet-explorer.zksync.dev/contract_verification"
    },
  },
  solidity: {
    version: "0.8.8",
  },
};
