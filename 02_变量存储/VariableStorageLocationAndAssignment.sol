// SPDX-License-Identifier: MIT
//pragma solidity 0.8.7;
pragma solidity >=0.6.0 <0.9.0;

//变量存储位置和赋值
contract VariableStorageLocationAndAssignment{

    //6.数据存储位置：
    //storage: 存储在链上，消耗gas 多；
    //memory： 存储在内存中，消耗gas少；
    //calldata：存储在内存中，消耗gas少，于memory相比，calldata是不能被修改的，一般用于函数的参数上；

    //6.1 storage（合约的状态变量）赋值给本地storage（函数里的）时候，同类型的存储位置，会发生变化
    uint[] num = [1,2,3];
    function storageRefChanged() public returns(uint[] memory _num,uint[] memory _abc) {
        uint[] storage abc = num; //引用指向num,abc中的值被修改，num也会变化；
        abc[0] = 99;

        _num = num;
        _abc = abc;
    }

    //6.2 storage 和 memory之间转换赋值，会创建副本，互不影响；
    uint[] x = [1,2,3];
    uint[] y = [1,2,3];
    function storageRefCopyed() public returns(uint[] memory _x,uint[] memory _y,uint[] memory _a,uint[] memory _b){
        uint[] storage a = x; 
        a[0] = 100;
        a[1] = 200;

        uint[] memory b = y;
        b[0] = 888;
        b[1] = 999;

        _x = x;
        _y = y;
        _a = a;
        _b = b;
        /* 执行结果：
        {
            "0": "uint256[]: _x 100,200,3",  // storage x -> storage a ，由于都是storage，修改值后a后，x,a 都发生了变化
            "1": "uint256[]: _y 1,2,3",      // storage y -> memory b ，由于存储位置不一样，赋值时会创建副本，修改值后b后，y没有发生变化，只有b被修改了
            "2": "uint256[]: _a 100,200,3",
            "3": "uint256[]: _b 888,999,3"
        }
        */
    }

    //6.3  memory 与 memory之间赋值，与storage一样，都会发生改变
    function memoryRefChanged(uint[] memory memNum) public pure  returns(uint[] memory _memNum,uint[] memory _abc) {
        uint[] memory abc = memNum; //引用指向memNum,abc中的值被修改，memNum也会变化；
        abc[0] = 99;

        _memNum = memNum;
        _abc = abc;
         /* 执行返回结果：
        {
            "0": "uint256[]: _memNum 99,2,3",  
            "1": "uint256[]: _abc 99,2,3"
        }
        */
    } 

    //6.4  本地变量赋值给 memory，会拷贝副本，不会发生变化
    uint[] memNum1 = [1,2,3];
    function memoryRefNoChanged() public view returns(uint[] memory _memNum,uint[] memory _abc) {
        uint[] memory abc = memNum1; 
        abc[0] = 99;

        _memNum = memNum1;
        _abc = abc;
         /* 执行返回结果：
        {
            "0": "uint256[]: _memNum 1,2,3",  //拷贝了副本,abc中的值被修改，memNum没有发生变化；
	        "1": "uint256[]: _abc 99,2,3"
        }
        */
    } 

}
