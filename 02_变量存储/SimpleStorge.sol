// SPDX-License-Identifier: MIT
//pragma solidity 0.8.7;
pragma solidity >=0.6.0 <0.9.0;

contract SimpleStorge{
    bool isCommit = true;
    //默认256
    uint256 internal commitTotal = 2323; 

    int32 public commitCount = 222;

    string public commitName = "0x51bit";

    address from = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    //最大 32
    bytes32 public commitByte;

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

    function incrCommitCount(SimpleStorge _simpleStorge) public  returns (int32 _cmmitCount) {
        //外部和合约调用SimpleStorge的incrCommitCount函数，incrCommitCount函数被public/external 修饰时，编译通过，private提示函数不可见
        extCommitCount = _simpleStorge.incrCommitCount();
        return extCommitCount;
    }
}


/**
    派生合约
 */ 
contract SonSimpleStorge is SimpleStorge{
    // 当 SimpleStorge 合约中的 commitTotal 被public\internal 修饰时 编译通过，private 编译提示：未定义
    uint256 public sonCommitTotal = commitTotal;

    function getCommitCount() public view returns(int32){
        return commitCount;
    }
}