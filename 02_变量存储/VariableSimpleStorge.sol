// SPDX-License-Identifier: MIT
//pragma solidity 0.8.7;
pragma solidity >=0.6.0 <0.9.0;

contract VariableSimpleStorge{

    //1.布尔
    bool isCommit = true;

    // 2.整型
    int public _int = -1; // 整数，包括负数
    uint public _uint = 1; // 正整数

    //默认256
    uint256 internal commitTotal = 2323; 

    int32 public commitCount = 222;

    string public commitName = "0x51bit";

    //3.地址类型
    //地址类型地址类型(address)存储一个 20 字节的值（以太坊地址的大小）。地址类型也有成员变量，并作为所有合约的基础。有普通的地址和可以转账ETH的地址（payable）。
    //其中，payable修饰的地址相对普通地址多了transfer和send两个成员。
    //在payable修饰的地址中，send执行失败不会影响当前合约的执行（但是返回false值，需要开发人员检查send返回值）。
    //balance和transfer()，可以用来查询ETH余额以及安全转账（内置执行失败的处理）。
    address from = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // payable address，可以转账、查余额
    address payable public _address1 = payable(from); 
    // 地址类型的成员
    uint256 public balance = _address1.balance; // balance of address

    //4. 定长字节数组
    //字节数组bytes分两种，一种定长（byte, bytes8, bytes32），另一种不定长。定长的属于数值类型，不定长的是引用类型（之后讲）。 定长bytes可以存一些数据，消耗gas比较少。
    //最大 32
    bytes32 public commitByte;
    // 固定长度的字节数组
    bytes32 public _byte32 = "MiniSolidity"; //MiniSolidity变量以字节的方式存储进变量_byte32，转换成16进制为：0x4d696e69536f6c69646974790000000000000000000000000000000000000000
    bytes1 public _byte = _byte32[0]; //_byte变量存储_byte32的第一个字节，为0x4d。

    //5. 枚举 enum ,enum是一个比较冷门的变量，几乎没什么人用。
    //枚举（enum）是solidity中用户定义的数据类型。它主要用于为uint分配名称，使程序易于阅读和维护。它与C语言中的enum类似，使用名称来代替从0开始的uint：
    // 用enum将uint 0， 1， 2表示为Buy, Hold, Sell
    enum ActionSet { Buy, Hold, Sell }
    // 创建enum变量 action
    ActionSet action = ActionSet.Buy;
    //它可以显式的和uint相互转换，并会检查转换的正整数是否在枚举的长度内，不然会报错：
    // enum可以和uint显式的转换
    function enumToUint() external view returns(uint){
        return uint(action);
    }

    function resetCommitTotal(uint256 _commitTotal) public{
        commitTotal = _commitTotal;
    }

    function incrCommitCount() public returns (int32 _cmmitCount) {
        commitCount = commitCount + 1;
        return commitCount;
    }
}


/**
 * 外部合约
  */
contract ExternalContract{
    int32 public extCommitCount;

    function incrCommitCount(VariableSimpleStorge _simpleStorge) public  returns (int32 _cmmitCount) {
        //外部和合约调用SimpleStorge的incrCommitCount函数，incrCommitCount函数被public/external 修饰时，编译通过，private提示函数不可见
        extCommitCount = _simpleStorge.incrCommitCount();
        return extCommitCount;
    }
}


/**
    派生合约
 */ 
contract SonSimpleStorge is VariableSimpleStorge{
    // 当 SimpleStorge 合约中的 commitTotal 被public\internal 修饰时 编译通过，private 编译提示：未定义
    uint256 public sonCommitTotal = commitTotal;

    function getCommitCount() public view returns(int32){
        return commitCount;
    }
}