# Simple SCM

## Overview

The **Simple SCM** project is a demonstration of Solidity fundamentals through a basic product management system. This project covers key Solidity concepts including variables, structs, mappings, inheritance, functions, events, and modifiers. The goal is to showcase these basics in a practical example.

## Features

- **Ownership Control**: Functions restricted to the contract owner.
- **Product Management**: Create, store, and manage products with unique identifiers.
- **Event Logging**: Logs important actions such as product creation and shipping

## Contract Files

The project includes the following Solidity files:

- **`Ownable.sol`**: Implements ownership functionality for the smart contracts.
- **`Product.sol`**: Defines the `Product` struct and provides methods to create and manage products.
- **`ProductManager.sol`**: Manages product creation, storage, and shipping operations.

### Ownable.sol

This contract sets up ownership for the smart contracts, including:

- Assigning ownership to an account.
- Restricting specific functions to only the owner.

### Product.sol

Defines the `Product` struct with:

- `productCode`: A unique code for the product.
- `productName`: The name of the product.
- `isExist`: The status of the product.

Includes functionality to:

- Create products and map them to unique IDs.
- Store and retrieve product details.

### ProductManager.sol

Extends the `Ownable` contract and provides:

- `notifyStoredProduct`: Notify the network when product is stored.
- `notifyShippedProduct`: Notify the network when product is shipped.
