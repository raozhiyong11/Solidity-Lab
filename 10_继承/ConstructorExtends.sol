// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ConstructorExtends{


}

contract Grandfather{
    string public name;
    int public age;

    constructor(string memory _name,int _age){
        name = _name;
        age = _age;
    }

    //使用 virtual 声明此函数可以被重写
    function getFavorite() public virtual pure  returns(string memory _favorite){
        _favorite = "drink wine";
    }

}

//构造函数继承：直接传值
contract Uncle is Grandfather("Tom",68){
    //使用 super调用 父合约的函数
    function getFatherFavorite() public pure returns (string memory _fatherFavorite){
        _fatherFavorite = super.getFavorite();
    }
}

//构造函数继承：传入输入值
contract Father is Grandfather{
    constructor(string memory _name,int _age) Grandfather(_name,_age){

    }

    //使用 父合约名称 调用 父合约的函数
    function getFatherFavorite() public pure returns (string memory _fatherFavorite){
        _fatherFavorite = Grandfather.getFavorite();
    }


}