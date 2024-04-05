## Deployment

-   You will need a [MetaMask](https://chromewebstore.google.com/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn) wallet.
-   To test the bonus, you will need 4 accounts.
-   Transactions require SepoliaETH. You can get some at https://sepolia-faucet.pk910.de/.
-   Visit https://remix.ethereum.org/
-   Connect all 4 MetaMask accounts to https://remix.ethereum.org/.

![connect metamask](/documentation/images/mmconnect.png)

-   Select OpenZeppelin's ERC20 template.
-   Remove `scripts` and `tests` folders.
-   Copy code from [OogaBooga42.sol](/code/OogaBooga42.sol).
-   Compile the code (`Ctrl+S`).
-   Visit the Deploy tab on the left.

![deploy tab](/documentation/images/deploytab.png)

-   Select the MetaMask provider.

![injected provider](/documentation/images/injected_provider.png)

From now on, the Metamask extension will sometimes ask for confirmation. Always accept.

-   In the Deploy section, write `[0xaddress1,0xaddress2,0xaddress3],2`, replacing with the addresses of the 3 owners you want for this token.
-   Click on `Deploy`.
-   You should see a MetaMask popup.

![confirm metamask](/documentation/images/confirm_metamask.png)

-   Confirm. Wait. Congratulations, you have deployed your own shitcoin.

![congratulations](/documentation/images/contracts_list.png)

## Usage

-   Copy the contract address.
-   Import it on each account in MetaMask. The owner should have 1000 OB42. All other accounts should have 0.

### Send (mandatory)

-   From Account 1, click Send.
-   Choose Account 2. Asset: OB42, Amount: 0.1 OB42. Next.

![send some tokens](/documentation/images/send.png)

-   Confirm. Wait. Account 1 should have 999.9 OB42. Account 2 should have 0.01 OB42.

### Mint (multisig)

-   Multisig is not part of the ERC20 standard, so MetaMask does not have an interface. Go back to the `Deploy` tab in [Remix](https://remix.ethereum.org/).
-   Expand the deployed contract.
-   From one of the owner accounts, enter `0xSOMEADDRESS,42000000000000000000`. Click `submitOperation`. Confirm. Wait. There are 18 zeros, because it is the number of decimals of our token. This operation will create 42 OB42 out of thin air. But we need approval first.
-   Since this is the first multisig operation, it is index 0. Enter 0 in `confirmOperation`. Confirm. Wait.
-   Switch to another owner account. Enter 0 in `confirmOperation`. Confirm. Wait.
-   2 owners have signed the operation, so we can execute it. Enter 0 in `executeOperation`. Confirm. Wait.
-   Click `totalSupply`. There should be 1042 OB42. Congratulations, you have printed money.

![multisig success](/documentation/images/multisig_success.png)
