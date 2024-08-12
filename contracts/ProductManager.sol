// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

// Importing Product contract interface
import "./Product.sol";
// Importing Ownable contract to manage ownership permissions
import "./Ownable.sol";

// Contract for managing products, inherits from Ownable
contract ProductManager is Ownable {
    // Event emitted when a product is stored
    event ProductStored(string _name, uint256 _productCode);
    // Event emitted when a product is shipped
    event ProductShipped(uint256 _index);

    // Reference to the Product contract
    Product public productContract;

    // Constructor to set the address of the Product contract
    constructor(address _productContractAddress) {
        require(_productContractAddress != address(0), "Invalid address");
        // Initialize the product contract with the provided address
        productContract = Product(_productContractAddress);
    }

    // Function to notify that a product is stored, restricted to owner
    function notifyStoredProduct(string memory _name, uint256 _productCode)
        public
        onlyOwner
    {
        require(bytes(_name).length > 0, "Product name is required");

        // Store the product in the Product contract
        productContract.storeProduct(_name, _productCode);
        // Emit an event for storing the product
        emit ProductStored(_name, _productCode);
    }

    // Function to notify that a product is shipped, restricted to owner
    function notifyShippedProduct(uint256 _index) public onlyOwner {
        require(_index >= 0, "Index must be non-negative");

        // Ship the product from the Product contract
        productContract.shipProduct(_index);
        // Emit an event for shipping the product
        emit ProductShipped(_index);
    }
}
