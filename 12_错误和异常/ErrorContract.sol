// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ErrorContrct{
    //error是solidity 0.8之后新增加的功能，它能相比require更省gas并且可以携带参数

    //定一个错误资金不足异常
    error NotEnoughFunds(address _from);

    function transfer(uint _amount,address payable _to) public {
        if(msg.sender.balance < _amount){
            //使用revert 抛出错误，回滚交易，之前已经产生的gas会扣除，之后的gas会返回
            revert NotEnoughFunds(msg.sender);
        }

        //从合约地址转账到目标to地址
        (bool sent,) = _to.call{value: _amount,gas: 300000}("");
        require(sent,"faild to send ether");
    }



}