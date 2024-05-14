// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract StructType{

    struct Address{
        string province;
        string city;
    }

    //结构体
    struct User{
        string name;
        uint age;
        uint256 id;
        address addr;
        //嵌套结构体
        Address homeAddr;

    }

    User public user;

    function setUser() public returns(User memory _user){
        //初始化地址信息,直接为引用类型赋值
        Address memory homeAddr;
        homeAddr.city = 'ShenZhen';
        homeAddr.province = 'GuangDong';
        //通过构造函数赋值，初始化
        user = User("51bit", 18, 1, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,homeAddr);

        _user = user;
    }

    

}