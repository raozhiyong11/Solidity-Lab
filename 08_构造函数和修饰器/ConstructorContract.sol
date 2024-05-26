// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ConstructorContract{
    //合约部署者
    address _owner;
    /*
        构造函数仅在合约部署时被调用一次，通常用来初始化合约参数；
        他是特殊的函数，不需要使用function修饰，没有返回值，不能设置为prue和view状态；
        如果需要在合约部署的时候向合约存入以太币，需要将可构造函数见性设置为payable；
    */
    constructor(){
        //在合约部署时，将合约的部署者这是为部署者的地址
       _owner = msg.sender;

    }

    // 只允许合约部署者操作
    function operate() public view {
        require(msg.sender == _owner, "caller is not the owner");
        // ......
    }

    // 获取合约部署者
    function owner() public view returns (address) {
        return _owner;
    }

}