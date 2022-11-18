// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

interface MyNFT {
    function safeMint(
        address to,
        string calldata subscriptionType,
        string calldata expirationDate
    ) external returns(uint256);

    function transferOwnership(address newOwner) external;
}

contract Factory is Ownable {
    MyNFT nft;

    constructor(address _address) payable {
        nft = MyNFT(_address);
    }

    function mint(address[] calldata addresses) onlyOwner public {
        for (uint i=0; i < addresses.length; i++) {
            nft.safeMint(addresses[i], 'subscriptionType', 'expirationDate');
        }
    }

    function revertOwnership() onlyOwner public {
        nft.transferOwnership(msg.sender);
    }
}
