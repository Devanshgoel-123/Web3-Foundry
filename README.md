# Web3-Foundry

### Solidity projects built and tested with Foundry

![Solidity](https://img.shields.io/badge/Solidity-363636?logo=solidity&logoColor=white) ![Foundry](https://img.shields.io/badge/Foundry-1C1C1C?logo=ethereum&logoColor=white)

| Project | What it is |
|---|---|
| [`foundryFundMe/`](foundryFundMe) | A crowdfunding contract with a minimum USD contribution, using a Chainlink price feed (`PriceConverter`). Includes deploy and interaction scripts, a network helper config, mocks (`MockV3Aggregator`), and a test suite. |
| [`foundrySimpleStorage/`](foundrySimpleStorage) | A minimal storage contract with a deploy script |

Both projects run their tests on GitHub Actions.

```bash
cd foundryFundMe
forge install && forge build
forge test -vvv
forge script script/DeployFundMe.s.sol --rpc-url $RPC_URL --broadcast
```
