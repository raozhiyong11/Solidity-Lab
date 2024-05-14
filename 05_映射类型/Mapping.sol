// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Mapping {
    //id 映射 名称
    mapping(uint => string) public idToName;
    //id 映射 地址
    mapping(uint => address) public idToAddr;

    //设置映射
    function mappingVal() public {
        idToName[1] = "51bit"; //赋值
        idToName[1] = "mask"; //mask 会覆盖 51bit

        idToAddr[3] = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    }

    //查询获取映射
    function getMappingVal(uint _key) public view returns(string memory _name,address _address){
        _name = idToName[_key]; //如果映射声明为public，那么solidity会自动给你创建一个getter函数，可以通过Key来查询对应的Valu
        _address = idToAddr[_key]; //若根据_key查询为设置value的映射，将返回各种类型的默认值，如：uint是0，address是0x0000000000000000000000000000000000000000，因为Ethereum会定义所有未使用的空间为0
   
    }

    struct User{
        string name;
        int age;
    }

    //mapping的key仅允许基本类型、契约类型或枚举作为映射键，不能使用自定义机构类型，如下代码会报错；
    //TypeError: Only elementary types, contract types or enums are allowed as mapping keys.类型错误：仅允许基本类型、契约类型或枚举作为映射键
    //mapping(User => string) public keyCannotStruct;

    // value 却可以是自定义类型
    mapping(uint => User) public valueCanStruct;

    //映射的存储位置必须是storage，因此可以用于合约的状态变量，函数中的storage变量，和library函数的参数（见例子）。
    //不能用于public函数的参数或返回结果中，因为mapping记录的是一种关系 (key - value pair)。
    //function cannotBeParam(valueCanStruct _a) public{
        //_a[1];
        //TypeError: Name has to refer to a struct, enum or contract.
    //}

    //mapping不能用于返回值中： //TypeError: Name has to refer to a struct, enum or contract.
    //function cannotBeReturn() public returns(valueCanStruct _valueCanStruct){
       
    //}



}