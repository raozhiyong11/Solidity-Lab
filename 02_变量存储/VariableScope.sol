// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//变量作用于：Solidity中变量按作用域划分有三种，分别是状态变量（state variable），局部变量（local variable）和全局变量(global variable)
contract VariableScope{

    //1、状态变量（state variable）,在合约内函数外定义，在连上存储，gas fee比较贵，合约内函数都可以访问
    uint public count = 1;
    bytes32 public status = '2';
    string public str = '51bit';
    address public from = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    //可以在函数中变更状态变量的值
    function changeValues() public {
        count = 100;
        status = "xxx";
        str = "0x51bit"; 
    }
    
    //2、局部变量（local variable）,在函数执行过程中有效的变量，函数执行完退出后无效，在内存存储，不上链，gas fee低；
    function localVriable() pure public returns (string memory _memory) {
        string memory str1 = "100";
        bytes32 status1 = '2';

        string memory str2 = string(abi.encodePacked(str1, status1));
        return str2;
    }
    
    
    //3、全局变量(global variable)
    function globalVriable() public payable returns (uint256 _blockNumber, uint256 _timestamp, address _from,uint256 _gas, bytes memory _calldate, uint256 _tradeValue) {
        //区块高度
        uint256 blockNumber = block.number;
        //区块时间戳
        uint256 timestamp = block.timestamp;
        //调用者地址
        address fromAddress = msg.sender;
        //剩余 gas
        uint256 gas =  gasleft();
        //交易完整call data
        bytes memory calldate = msg.data;
        //交易金额
        uint tradeValue = msg.value;

        return (blockNumber, timestamp, fromAddress , gas, calldate, tradeValue); 
    }
    //solidity 更多全局变量 请参考：https://learnblockchain.cn/docs/solidity/units-and-global-variables.html#special-variables-and-functions
    



}
