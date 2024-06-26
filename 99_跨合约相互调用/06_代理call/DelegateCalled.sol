// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//代理委托调用合约

//被调用合约
contract DelegateCalled{
    uint public count;
    address public sender;
    uint public value;

    function setVarStatus(uint _count) external payable {
        count = _count;
        sender = msg.sender;
        value = msg.value;
    }

}

//发起调用合约
contract DalegateCaller{
    uint public count;
    address public sender;
    uint public value;

    function setVarStatus(address _target,uint _count) external payable {
        (bool success,) = _target.delegatecall(
            //abi.encodeWithSignature("setVarStatus(uint)",_count)
            abi.encodeWithSelector(DelegateCalled.setVarStatus.selector, _count)
        );
        require(success,"delegatecall function failed");
    }
}