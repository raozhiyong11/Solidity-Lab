// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ConstructorExtends{


}


contract Grandfather{
    string public name;
    int public age;

    //校验年龄，必须在0 和 150之间
    modifier checkAge(int _age){
        require(_age>=0 && _age <= 150,"age must gt 0 and lt 150 ");
        _;
    }

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

    //设置年龄，使用了grandfather合约中的modifier校验合法性
    function setAge(int _age) public checkAge(_age){
        age = _age;
    }

}