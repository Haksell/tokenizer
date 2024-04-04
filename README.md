# Tokenizer

## Choices

-   You are free to choose the name of your token. Your only constraint is to have 42 in it. (OogaBooga42)
-   First and foremost, you will need to choose a blockchain platform that supports the creation of tokens. (Ethereum/Sepolia)
-   The language used is of course free. (Solidity)
-   You will need to ensure that you have the necessary skills to work with the language of your chosen platform. (Remix)

## Subject

-   [ ] You must therefore create a README.md file at the root of your repository explaining the choices you had to make and the reasons why you made these choices.
-   [ ] You must submit the code used to create your token in a code folder located at the root of your repository.
-   [ ] You should be careful to comment out your code and to use readable and explicit variable/function names.
-   [ ] You must be able to perform minimalist actions to demonstrate its operation. You need to think about all aspects of security such as ownership or privileges.
-   [ ] You should also put all the things you need for the deployment part of your token in a second folder with the name you want.
-   [ ] After deploying your token on a public blockchain. You will define its ticker and publish it on a blockchain explorer (ex: blockscan or bscscan). Please mention the smart contract address and the network used, in your Git repository.
-   [ ] Finally, you should have a folder containing the documentation for this project. This folder is called documentation and should be at the root of your repository. It should be possible to understand how it works and what is needed to use your token.
-   [ ] You will need to have a clear understanding of how your token will be used and what it will represent. This may require the development of a whitepaper or other documentation outlining the features and functionality of your token.
-   [ ] You must take the time to make a clear and explicit documentation.
-   [ ] To ensure the security of your token and prevent fraudulent activity, you may want to consider implementing a multisignature system, also known as a multisig.
-   [ ] This feature requires multiple parties to sign off on a transaction before it can be executed, providing an extra layer of protection for high-value assets or sensitive financial transactions.
-   [ ] Setting up a multisig system is easy using your preferred programming language by creating a smart contract that mandates multiple signatures for every transaction. Determine the number of signatures required and who is authorized to sign to enhance security and gain the trust of your token’s users.

## TODO

-   extend `IERC20` or `ERC20` from `openzeppelin`
-   [ ] `mint` multisig function
-   [ ] `split` / `double` multisig function
-   [ ] `burn` multisig function

## Resources

-   Blockchain 101 - Part 1: https://www.youtube.com/watch?v=_160oMzblY8
-   Blockchain 101 - Part 2: https://www.youtube.com/watch?v=xIDL_akeras
-   Proof-of-Stake (vs proof-of-work): https://www.youtube.com/watch?v=M3EFi_POhps
-   ERC20 tokens: https://www.youtube.com/watch?v=cqZhNzZoMh8
-   How to Deploy an ERC-20 Token with Remix: https://www.youtube.com/watch?v=TkbYDRzVe7g
-   Writing MultiSig wallet contract using Solidity: https://www.youtube.com/watch?v=G6Xhc-hLRFA
-   https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
-   https://www.investopedia.com/news/what-erc20-and-what-does-it-mean-ethereum/
-   https://sepolia-faucet.pk910.de/
-   https://remix.ethereum.org/
-   https://www.codewars.com/kata/search/solidity?q=&xids=completed&beta=false&order_by=total_completed%20desc
-   https://ethereum.org/en/developers/docs/
-   https://solidity-by-example.org/
-   https://sepolia.etherscan.io/
-   https://sepolia.otterscan.io/
