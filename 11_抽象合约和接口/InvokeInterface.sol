// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "./AbstractAndInterface.sol";

contract InvokeInterface{

    //传入合约地址，获得接口合约
    Female female = Female(0x7199069245A55f4092037BDDf22A18615e8FCa10);

    //调用女人生孩子的函数
    function birthToChild() public  returns(string memory _baby){
        _baby = female.birthToChild(uint(10000),uint(30)); 
    } 



}
