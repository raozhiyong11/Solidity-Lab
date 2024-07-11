// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

library Math {
    //两个数字，返回较小值
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }
    //两个数字，返回较大值
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a > b ? a : b;
    }

    //返回数组中指定数值的索引
    function indexOf(uint256[] memory array, uint256 value) internal pure returns (uint256) {
        for (uint256 i = 0; i < array.length; i++) {
            if (array[i] == value) {
                return i;
            }
        }
        revert("value can not find in array");
    }
}