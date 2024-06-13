// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract RequireAssert{

    uint public balance = 0;
    //require
    function requireFun(uint _amount) public {
        balance += 1;
        require(_amount > 10, "amount must > 10");//满足条件才会继续执行，否则回滚，之前的状态变更会被还原
        balance += _amount;
    }

    //assert,早期遗留的产物，建议使用require和assert,error
    function assertFun(uint _amount) public {
        balance += 1;
        assert(_amount > 10);//满足条件才会继续执行，否则回滚，之前的状态变更会被还原
        balance += _amount;
    }
    
    //revert
    function revertFun(uint _amount) public {
        balance += 1;
        if(_amount <= 10){
            revert("amount must > 10"); //终止交易，返回错误信息
        }
        balance += _amount;
    }

}

//require 和 assert 都能终止函数的执行，并回滚交易，但两者有一些区别。
//1、require 和 assert  参数不同，require 可以带有一个说明原因的参数，assert 没有这个参数。
//2、require 通常用于检查外部输入是否满足要求，而 assert 用于捕捉内部编程错误和异常情况。
//3、require 通常位于函数首部来检查参数，assert 则通常位于函数内部，当出现严重错误时触发。
//4、assert 是 Solidity 早期版本遗留下来的函数，不再建议使用，最好使用 require 和 revert 代替。