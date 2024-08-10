// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ContractA {
    uint256 public data;

    function setData(uint256 _data) public {
        data = _data;
    }
}

contract ContractB {
    function callSetData(address _contractAddress, uint256 _data) public {
        (bool success, ) = _contractAddress.call(
            (abi.encodeWithSignature("setData(uint256)", _data))
        );

        require(success, "Transaction failed.");
    }
}



