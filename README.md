# Chainlink Truffle Box

<br/>
<p align="center">
<a href="https://chain.link" target="_blank">
<img src="https://raw.githubusercontent.com/smartcontractkit/box/master/box-img-lg.png" width="225" alt="Chainlink Truffle logo">
</a>
</p>
<br/>

## Requirements

- NPM

## Installation

1. Install truffle
2. Install metamask chrome extension

```bash
npm install truffle -g
```

2. Setup repo

```bash
mkdir MyChainlinkProject
cd MyChainlinkProject/
truffle unbox smartcontractkit/box
```

4. Install dependencies by running:

```bash
npm install

# OR...

yarn install
```

## Test

```bash
npm test
```

## Deploy

For deploying to the kovan network, Truffle will use `truffle-hdwallet-provider` for your mnemonic and an RPC URL. Set your environment variables `$RPC_URL` and `$MNEMONIC` before running:

```bash
npm run migrate:kovan
```

You can also run:

```bash
truffle migrate --network kovan/rinkeby --reset
```
If you want to use truffle commands.

### Local Blockchain

> :warning: Without a Chainlink node deployed locally, requests from smart contracts will not be responded to. We recommend you deploy to the Kovan network

If needed, edit the `truffle-config.js` config file to set the desired network to a different port. It assumes any network is running the RPC port on 8545.

```bash
npm run migrate:dev
```




### Further additional steps todo: <br/>
1>make sure to add relevant api keys in sample env file and change name to .env<br/>
2>rpc url and mnemonic can be found at infura<br/>
3>ether scan api key can be found after signinu up at etherscan<br/>
4>Also signup at opensea testnet using metamask wallet and deploy your nft there<br/>
5> For deployment you can use any test network I have used rinkeby for the same and make sure to have test ethers in metamask wallet
