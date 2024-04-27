// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleStorge{
    bool isCommit = true;
    //默认256
    uint256 private commitTotal = 2323; 

    int32 public  commitCount = 222;

    string public commitName = "0x51bit";

    address from = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    //最大 32
    bytes32 public commitByte;

    function resetCommitTotal(uint256 _commitTotal) public{
        commitTotal = _commitTotal;
    }

    function incrCommitCount() public  returns (int32 _cmmitCount) {
        commitCount = commitCount + 1;
        return commitCount;
    }

    /*
    visibility（可见性修饰符）：
        public：该变量将自动生成一个公共的 getter 函数，可以被合约内外的任何地址读取。对于状态变量，公共可见性意味着 Solidity 会为其自动生成一个 getter 函数，允许其他合约或外部调用者读取其值。
        private：该变量只能在定义它的合约内部访问，其他合约或外部调用者无法访问。私有变量仅在合约内部使用，无法通过合约外部进行访问。
        internal：该变量只能在当前合约及其派生合约中访问。内部可见性意味着该变量对合约的内部逻辑可见，但对合约之外的调用者不可见。
        external：该变量只能通过合约的外部函数访问，不能在合约内部直接访问。外部可见性意味着该变量只能在合约的外部函数中被访问，通常用于合约接收以太币或者交互合约。

    State Mutability（状态可变性修饰符）：
        view：表示函数不会修改合约状态（即不会修改存储在合约中的数据），只读取数据并返回结果。在 view 函数内部，对合约状态的修改操作会导致编译错误。
        pure：表示函数不会读取或修改合约状态，也不会读取区块链的任何数据。它是一个纯函数，只是执行某些计算并返回结果。在 pure 函数内部，任何对合约状态或区块链状态的访问都会导致编译错误。
        payable：表示函数可以接受以太币作为调用的一部分。通常用于接收以太币的函数，如合约的接收函数（receive() 或 fallback()）或自定义接收以太币的函数。

    */





}