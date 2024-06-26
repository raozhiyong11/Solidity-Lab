
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//被调用合约
contract Called{
    string public message;
    uint public count;

    event logger(string message);

    receive() external payable { 
        emit logger("receive function has called!");
    }

    fallback() external payable { 
        emit logger("fallback ! function not exists");
    }

    function getValues(string memory _message,uint _count) external returns(string memory,uint){
        message = _message;
        count = _count;
        return (message,count);
    }

    //接收代币
    function callAndReceiveToken(string memory _message,uint _count) external payable returns(string memory,uint){
        message = _message;
        count = _count;
        return (message,count);
    }

    //获取余额
    function getBalance() public view  returns (uint _balance) {
        return msg.sender.balance;
    }


}

//调用合约
contract Caller{

    bytes public data;
    event logger(string message,uint balance);

    //只调用外部合约的函数
    function callGetValues(address _calledContractAddress) public {
        (bool success, bytes memory _data) = _calledContractAddress.call(
            abi.encodeWithSignature("getValues(string,uint256)", "hello , i called you ",11111)
        );
        require(success,"call function faild");
        data = _data;
    }

    //调用外部合约的函数,并发送代币
    function callAndSendToken(address _calledContractAddress) public payable  {
        emit logger("show balance:", address(this).balance);
        require(address(this).balance > 11111, "Insufficient balance in Caller contract");
        
        (bool success, bytes memory _data) = _calledContractAddress.call{value:11111}(
            abi.encodeWithSignature("callAndReceiveToken(string,uint256)", "hello , i called you,and send token ",222222)
        );
        require(success,"call function and send token faild");
        data = _data;
    }


    //调用外部合约不存在的函数
    function callNotExistsFun(address _calledContractAddress) public {
        (bool success, ) = _calledContractAddress.call(
            abi.encodeWithSignature("imNotExists(string,uint256)")
        );
        require(success,"called faild, function not exists");
    }

}