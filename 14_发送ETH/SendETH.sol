// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SendETH {

    constructor() payable {}

    //transfer()的gas限制是2300，足够用于转账，但对方合约的fallback()或receive()函数不能实现太复杂的逻辑。
    //transfer()如果转账失败，会自动revert（回滚交易）。
    function transfer(address payable _to, uint _amount) public payable {
        _to.transfer(_amount);
    }

    //send()的gas限制是2300，足够用于转账，但对方合约的fallback()或receive()函数不能实现太复杂的逻辑。
    //send()如果转账失败，不会revert。需要开发者自行处理异常；
    //send()的返回值是bool，代表着转账成功或失败，需要额外代码处理一下。
    function send(address payable _to, uint _amount) public payable {
        bool success = _to.send(_amount);
        require(success, "Failed to send Ether");
    }

    error SendETHCallFailed();

    //call()没有gas限制，可以支持对方合约fallback()或receive()函数实现复杂逻辑。
    //call()如果转账失败，不会revert。
    //call()的返回值是(bool, bytes)，其中bool代表着转账成功或失败，需要额外代码处理一下。 
    function call(address payable _to, uint _amount) public payable {
        (bool success, ) = _to.call{value: _amount}("");
        if (!success) {
            revert SendETHCallFailed();
        }
    }
}