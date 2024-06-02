// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract MultipleExtends{


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
    function getFavorite() public virtual override  pure  returns(string memory _favorite){
        _favorite = "play basketball";
    }

}

//继承时要按辈分最高到最低的顺序排,否则编译报错
contract Son is Grandfather,Father{
    //如果某一个函数在多个继承的合约里都存在，在子合约里必须重写，不然会报错:Derived contract must override function "getFavorite". Two or more base classes define function with same name and parameter types.
    //重写在多个父合约中都重名的函数时，override关键字后面要加上所有父合约名字，例如override(Grandfather,Father) 
    function getFavorite() public override(Grandfather,Father)  pure  returns(string memory _favorite){
        _favorite = "play football";
    }

}