# MyToken - Custom ERC-20 Token

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

A basic implementation of an ERC-20 token written from scratch in Solidity for educational purposes. This contract demonstrates a deep understanding of the ERC-20 standard by building it without OpenZeppelin templates.

## 🪙 Overview

This smart contract implements a fungible token following the ERC-20 standard. It includes all core functionalities:
- Token transfers (`transfer`, `transferFrom`)
- Approvals and allowances (`approve`)
- Minting new tokens (owner-only)
- Burning tokens
- Balance tracking
- Event emission for off-chain tracking

## ✨ Features

- **Full ERC-20 Compatibility**: Implements all mandatory functions and events from the EIP-20 specification
- **Minting Function**: Owner can create new tokens (`mint`)
- **Burning Function**: Any holder can destroy their tokens (`burn`)
- **Owner Controls**: Special privileges for the contract deployer
- **Educational Value**: Clean, commented code showing how ERC-20 works under the hood

## 📋 Contract Details

| Property | Value |
|----------|-------|
| **Name** | `MyToken` (configurable) |
| **Symbol** | Configurable at deployment |
| **Decimals** | 18 |
| **License** | GPL-3.0 |
| **Solidity Version** | ^0.8.0 |

## 🔧 Functions

### Core ERC-20 Functions
| Function | Description |
|----------|-------------|
| `transfer(to, value)` | Send tokens to another address |
| `approve(spender, value)` | Allow another address to spend your tokens |
| `transferFrom(from, to, value)` | Transfer tokens on behalf of owner |
| `balanceOf(account)` | Check token balance of any address |
| `allowance(owner, spender)` | Check remaining spending allowance |

### Custom Functions
| Function | Description | Access |
|----------|-------------|--------|
| `mint(to, value)` | Create new tokens | Only Owner |
| `burn(value)` | Destroy your own tokens | Anyone |
| `totalSupply()` | Get total token supply | Anyone |

## 🚀 Deployment

### Prerequisites
- Any Ethereum development environment (Remix, Hardhat, Truffle)
- Solidity compiler version ^0.8.0

### Constructor Parameters
When deploying, you need to provide:
1. `_name`: Token name (e.g., "MyToken")
2. `_symbol`: Token symbol (e.g., "MTK")
3. `_initialSupply`: Initial token supply (in wei, e.g., 1000000000000000000000 for 1000 tokens)

### Example (Remix)
1. Open [Remix IDE](https://remix.ethereum.org/)
2. Create a new file `MyToken.sol` and paste the code
3. Compile with Solidity version 0.8.x
4. Deploy with parameters: `"MyToken", "MTK", 1000000000000000000000`

## 💡 Usage Examples

### Transfer Tokens
```solidity
// Transfer 100 tokens (with 18 decimals)
token.transfer(recipientAddress, 100 * 10**18);
```

### Approve and TransferFrom
```solidity
// Owner approves spender
token.approve(spenderAddress, 50 * 10**18);

// Spender transfers on behalf of owner
token.transferFrom(ownerAddress, recipientAddress, 50 * 10**18);
```

### Mint New Tokens (Owner only)
```solidity
token.mint(recipientAddress, 1000 * 10**18);
```

### Burn Tokens
```solidity
token.burn(10 * 10**18);
```

## 🧪 Testing (Manual)

Since this contract doesn't include automated tests, you can test it manually in Remix:

1. **Deploy** the contract with initial supply
2. **Check balances**: Call `balanceOf(deployerAddress)`
3. **Transfer**: Send tokens to another address
4. **Approve**: Allow another address to spend tokens
5. **TransferFrom**: Use the approved address to move tokens
6. **Mint** (as owner): Create new tokens
7. **Burn**: Destroy tokens from your balance

## 🔐 Security Considerations

- Only the contract owner can mint new tokens
- Built-in zero-address checks prevent burning tokens by sending to `address(0)`
- Follows checks-effects-interactions pattern
- No reentrancy vulnerabilities due to simple state changes

## 📚 Learning Resources

This contract was built to understand:
- How ERC-20 tokens actually work internally
- The mapping structure for balances and allowances
- Event emission for blockchain logging
- Access control patterns with modifiers

## 👨‍💻 Author

**Rafael**
- GitHub: [@godKraken123](https://github.com/godKraken123)

## ⚖️ License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.
