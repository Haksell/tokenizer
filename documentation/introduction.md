# Introduction to Ethereum and ERC20 Tokens

## What is Ethereum?

Ethereum is a decentralized, open-source blockchain system featuring smart contract functionality. It's a platform that allows developers to build and deploy decentralized applications (dApps) and cryptocurrencies. Ethereum is often referred to as a computer on the blockchain because of its ability to execute code on a global network of computers. This technology not only supports its native cryptocurrency, Ether (ETH), but also enables independent applications and tokens to coexist. Solidity is the most used programming language to build Ethereum contracts. [More](https://ethereum.org/en/developers/docs/intro-to-ethereum/)

## What is ERC20?

ERC20 is a standard for creating and issuing smart contracts on the Ethereum blockchain. This standard defines a set of rules that apply to all ERC20 tokens, ensuring consistency, interoperability, and functionality within the Ethereum ecosystem.

ERC20 contracts must implement the following methods: `totalSupply`, `balanceOf`, `transfer`, `approve`, `allowance` and `transferFrom`.

ERC20 tokens are versatile and can be used in various applications:

-   Governance Tokens: Some projects use ERC20 tokens to grant holders voting rights on decisions affecting the project's future.
-   Utility Tokens: Tokens can grant access to services or features within a dApp, such as transaction capabilities or access to premium content.
-   Security Tokens: Representing investment in real-world assets, like real estate or stocks, providing a bridge between traditional finance and the blockchain world.
-   Digital Currencies: Most cryptocurrencies are issued as ERC20 tokens, functioning similarly to Ether but within specific projects or ecosystems. This is what this project is about.

[More](https://ethereum.org/en/developers/docs/standards/tokens/erc-20/)

## What is multisig?

Multisig refers to requiring multiple signatures or approvals before executing a transaction on the blockchain. This feature adds an extra layer of security, making it harder for unauthorized users to access funds or perform transactions without consensus. Multisig wallets are especially useful for organizations or any scenario where shared control over assets is necessary.
