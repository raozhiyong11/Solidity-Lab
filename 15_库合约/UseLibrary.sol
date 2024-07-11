// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./Math.sol";

//库合约2个作用：1、代码重复利用；2、省gas fee
contract UseLibrary {

    //两种使用库合约的方式
    //第一种：使用库合约的名称+ . + 函数名称 
    function testmin() public pure returns(uint){
        return Math.min(111,5);
    }

    function testMax() public pure returns(uint){
        return Math.max(1,2);
    }

    //第二种：使用using for 指令 
    using Math for uint[];
    function testIndexOf() public pure returns(uint){
        uint[] memory arr = new uint[](3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        return arr.indexOf(6); //使得 uint 数组具备了indexOf的能力
    }


}
