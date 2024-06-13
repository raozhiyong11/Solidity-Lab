// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract TryCatch{
    //在 Solidity 中，try 语句只能用于外部函数调用和合约创建调用，不能用于内部函数调用。内部函数的调用只能使用断言语句。

    //简单除法函数
    function divide(uint _a,uint _b) external pure returns(uint){
        if(_b == 0){
            revert(" division is zero !");
        }

        return (_a/_b);
    }

    //异常处理函数
    function tryCatch(uint _a,uint _b) public view returns(uint){
        try this.divide(_a, _b) returns (uint _result){
            //正常执行操作
            return _result;
        }catch Error(string memory errMsg){
            //铺抓到异常信息
            revert(errMsg);
        }catch{
            // 处理未预料到的异常
            revert("Unknown error occurred");
        }
    }

}