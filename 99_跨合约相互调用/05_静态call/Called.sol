
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//staticcall 是一个低级别的操作，它允许一个合约在调用外部合约函数时，仅限于读取外部合约的数据而不修改它的状态。也就是说，staticcall 的只能调用外部合约的视图函数和纯函数，即函数的状态可变性为 view 或 pure 函数。

//被调用合约
contract Called{

    string public message;
    uint public count;

    function getValues(string memory _message,uint _count) external pure returns(string memory,uint){
        _count = _count + 10;
        //message = _message;
        //count = _count;
        return (_message,_count);
    }


}

//调用合约
contract Caller{

    string public message;
    uint public count;

    //只调用外部合约的函数
    function callGetValues(address _calledContractAddress) public {
        (bool success, bytes memory _data) = _calledContractAddress.staticcall(
            abi.encodeWithSignature("getValues(string,uint256)", "hello , i called you ",11111)
        );
        require(success,"call function faild");

        (message,count) = abi.decode(_data, (string,uint));
    }


}