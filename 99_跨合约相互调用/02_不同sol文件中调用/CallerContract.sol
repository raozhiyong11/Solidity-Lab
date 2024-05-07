// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import './CalledContract.sol';

/*
    调用方合约
*/
contract CallerContract{

    //第一种：传入合约地址 调用目标合约
    function inputContractAddressCallOtherContract(address _targetAddress,uint256 _count) public {
        CalledContract(_targetAddress).setCount(_count);

    }

    //第二种：传入合约变量 调用目标合约
    function inputContractVariableCallOtherContract(CalledContract _targetContract) public view returns (uint256){
        return _targetContract.getCount();
    }

    //第三种：创建合约变量 调用目标合约
    function createContractVariableCallOtherContract(address _targetAddress) public view returns (uint balance){
        CalledContract calledContract = CalledContract(_targetAddress);
        balance = calledContract.getBalance();
        return balance;

    }

}