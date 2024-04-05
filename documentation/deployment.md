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
