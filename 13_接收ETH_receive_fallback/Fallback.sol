
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
/**
fallback 函数有如下几个特点：

1）无需使用 function声明。
2）参数为空。
3）可见性必须设置为 external。
4）状态可变性可以为空，或者设置为 payable。
*/
contract Fallback{

    //fallback 会在两种情况下，被外部事件触发而执行：
    //1) 外部调用了智能合约中不存在的函数
    //2) 外部向智能合约中存入以太币，并且当前合约中不存在 receive 函数

}

//1.智能合约中只定义 fallback 函数，而且状态可变性为 payable。执行fallback方法
contract OnlyFallback{
    
    event FallbackEnvent();
    //当我们向合约中存入以太币时，将会执行 fallback 函数，从而触发里面的 Fallback 事件。
    fallback() external payable {
        emit FallbackEnvent();
    }
}

//2.智能合约中同时定义了 receive 和 fallback 函数，而且两者的状态可变性都为 payable。正常执行receive方法
contract ReceiveAndFallback{
    event ReceiveEvent();
    event FallbackEnvent();

    //正常receive方法，当向合约存入以太币时，先执行这个方法
    receive() external payable {
        emit ReceiveEvent();
     }

    fallback() external payable {
        emit FallbackEnvent();
    }
}


//3、我们在 "CALLDATA" 栏中填入随意编写的 msg.data 数据，使之不为空（相当于调用了一个不存的函数），再点击 "Transact"。会触发 fallback函数