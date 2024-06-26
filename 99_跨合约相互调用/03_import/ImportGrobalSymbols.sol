// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {Bob} from '../dependency/Bob.sol';
//通过全局符号导入特定的合约
contract ImportGrobalSymbols{

    Bob bob = new Bob();

    function getCount() public view returns (uint256) {
        return bob.getCount();
    }

}