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








}