// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

// Contract for managing products, inherits from Ownable
contract Product{
    // Struct to store product details
    struct ProductItem {
        string name;
        uint256 productCode;
        bool isStored;
    }

    // Counter for product index
    uint256 public index;

    // Mapping to store products by index
    mapping(uint256 => ProductItem) public productMapping;

    // Function to store a new product
    function storeProduct(string memory _name, uint256 _productCode) public {
        require(bytes(_name).length > 0, "Product name is required");

        // Add a new product to the mapping
        productMapping[index] = ProductItem({
            name: _name,
            productCode: _productCode,
            isStored: false
        });

        // Increment the index for the next product
        index++;
    }

    // Function to mark a product as shipped
    function shipProduct(uint256 _index) public {
        require(_index < index, "Invalid product index");
        require(!productMapping[_index].isStored, "Product already shipped");

        // Mark the product as shipped
        productMapping[_index].isStored = true;
    }
}