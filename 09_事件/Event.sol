// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/*
在 Solidity 中，事件（event）是智能合约的一种通知机制，用于向外部程序或其它合约通知某个事件的发生。
触发一个事件后，相关数据就会存储到区块链的收据中，并与交易关联，记录在区块链上，以便外部应用监听和处理。
事件常常用于调试合约、追踪交易和数据统计等场景。比如：区块浏览器会使用 ERC20 代币合约的事件，对交易数据进行统计。
*/
contract Event{
    //定义一个事件
    event Transfer(address indexed from, address indexed to, uint256 value, string remark);

    //定义一个映射balances，用于记录 每个地址的余额；
    mapping(address => uint256) public  balances;

    //设置合约部署者 初始化余额，最大
    constructor() {
        balances[msg.sender] = type(uint256).max;
    }

    //转账到 to 地址
    function transfer(address to,uint256 value) external {
        //转出账户减少
        balances[msg.sender] -= value;
        //转入账户增加
        balances[to] += value;

        //触发事件
        emit Transfer(msg.sender, to, value, "transfer sucdes!");
    }



}