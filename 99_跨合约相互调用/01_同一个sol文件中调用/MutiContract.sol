// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/**
同sol文件的智能合约调用
在下面的智能合约中，Demo1和Demo2在同一个文件中，可进行同时编译，然后逐个发布。
**/
contract Demo1{
    
    uint public data;
    
    function setData(uint _data) public {
        data = _data;
    }
}

contract Demo2{
    function toSetData(Demo1 demo1,uint _data) public {
        demo1.setData(_data);
    }
}

//当发布完成，可通过第Demo2的toSetData方法进行Demo1方法的调用。传递的第一个参数为Demo1的智能合约地址，第二个参数为要设置的值。