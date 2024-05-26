// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ConstantAndImmutable{

    //string 和 bytes 只能使用constat修饰，使用immutable修饰编译报错：TypeError: Immutable variables cannot have a non-value type.
    // constant 只能在 申明的时候 初始化具体的值，否则编译报错
    string public constant NAME = '51bit';
    bytes public constant LAST_NAME = '0X';

    // 数值 使用 constant 和 immutable 都可以
    uint public immutable AGE = 12;
    uint public immutable NUMBER = 1000;
    address public immutable FROM = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint public immutable CONTRACT_NUMBER;
    address public immutable TO_ADDRESS = address(this);
    uint public immutable BLOCK_NUM;

    //immutable 可以在申明初始化值，或者在 构造函数中初始化值,
    constructor(){
        //直接数赋值；
        //CONTRACT_NUMBER = 100;
        //使用函数赋值；
        CONTRACT_NUMBER = getContractName();
        // 通过全局变量赋值
        BLOCK_NUM = block.number;
    }

    function getContractName() internal pure  returns(uint _contractName){
        _contractName = 100;
    }





}