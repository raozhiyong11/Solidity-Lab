
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import '../dependency/Bob.sol';
//相对路径导入
contract ImpoertRelativePath{

    Bob b = new Bob();

    function getCount() public view {
        b.getCount();
    }

}