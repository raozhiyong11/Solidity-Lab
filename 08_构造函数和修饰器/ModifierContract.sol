// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//修饰器可以在不改变函数本身，在函数执行前或者执行后改变函数行为，从而增强函数的功能
//修饰器在智能合约中使用非常普遍，常常用于验证输入参数、执行权限检查、记录日志等操作。
contract ModifierContract{

    address owner;  //部署地址
    mapping (address => bool) blacklist; //地址黑名单
    event LogWritten(address indexed caller); //事件用于记录日志

    constructor(){
        owner = msg.sender;
    }

    //带参数的修饰器
    modifier onlyOwnerAndGreatZero(int x){
        require(msg.sender == owner,"Only owner can call this functon!");
        //修饰器允许传参数
        require(x > 0, "x vulue must great 0 can pass!");
        _; //继续执行被修饰的函数
        writeLog(); //写日志
    }

    //设置白名单,只有合约拥有者，并且x>0才能执行
    function setBlacklist(address _account, int x) external onlyOwnerAndGreatZero(x){
        blacklist[_account] = true;
    }

    //判断某个地址是否在黑名单中
    function isBlacklist(address _account) external  view  returns(bool){
        return blacklist[_account];
    }

    //写日志
    function writeLog() internal{
        emit LogWritten(msg.sender);
    }


}