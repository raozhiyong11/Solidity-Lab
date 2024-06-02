// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleExtends{


}


contract Grandfather{
    string public name;
    int public age;
    //使用 virtual 声明此函数可以被重写
    function getFavorite() public virtual pure  returns(string memory _favorite){
        _favorite = "drink wine";
    }

}


contract Father is Grandfather{
    //使用 override 表示覆盖父合约中的 函数
    function getFavorite() public override  pure  returns(string memory _favorite){
        _favorite = "play basketball";
    }

}