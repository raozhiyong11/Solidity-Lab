// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    被调用目标合约
*/
contract Bob{

    uint256 public count = 0;

    function setCount(uint256 _count) external {
        count = _count;
    }

    function getCount() public view returns(uint256){
        return count;
    }

    function getBalance() public  view returns (uint){
        return address(this).balance;
    }

}