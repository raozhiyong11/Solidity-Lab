// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
//pragma solidity >=0.6.0 <0.9.0;

contract HelloWorld{
    string public message;

    constructor(string memory _message){
        message = _message;
    }

    function setMessage(string memory _message) public{
        message = _message;
    }

    function getMessage() public view returns(string memory){
        return message;
    }
        
}
