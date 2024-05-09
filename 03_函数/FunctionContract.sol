// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract FunctionContract{

    uint256 public count = 0;


    //pure 函数不能读取和修改变量
    function pureFun() pure public {
        //TypeError: Function declared as pure, but this expression (potentially) modifies the state and thus requires non-payable (the default) or payable.
        //count = count + 1; 
    }

    //以上可以改写为，传入一个参数，+1 再返回一个新的变量
    function pureFun(uint256 _count) pure public returns(uint256 _newCount){
        //TypeError: Function declared as pure, but this expression (potentially) modifies the state and thus requires non-payable (the default) or payable.
        _newCount = _count + 1; 
    }

    //view 函数能读取，但是不能修改变量
    function viewFun() view public {
        //TypeError: Function declared as view, but this expression (potentially) modifies the state and thus requires non-payable (the default) or payable.
        //count = count + 1; //编译报错 
        count + 1;
    }

    //以上可以定义一个新的变量,并返回；
    function viewFunReturn() view public returns(uint256 _newCount){
       return _newCount = count + 1;
    }

    //internal: 只能内部调用
    function internalFun() internal  {
        count = count + 2;
    }

    //external: 外部合约调用，但是可以通过
    function externalFun() external {
        count = count -1;
    }

    //调用函数
    function callExtIntFun() public {
        internalFun();
        //不能直接externalFun()，可以使用this.f()方式调用；
        this.externalFun();
    }


    // payable: 递钱，能给合约支付eth的函数
    function payableFun() external payable returns(uint256 balance) {
        internalFun();  
        
        //返回合约里的ETH余额（this关键字可以让我们引用合约地址)。 我们可以在调用internalFun()时，往合约里转入1个ETH。
        balance = address(this).balance;
    }



    //return : 返回多个变量
    function returnMutiVarFun() public pure returns(string memory _name,bool _flag,uint _age){
        return ('51bit',true,18);
    }

    //return : 命名式返回多个变量，不需要 return
    function returnMutiVarNoReturnFun() public pure returns(string memory _name,bool _flag,uint _age){
        _name = 'bit15';
        _flag = false;
        _age = 18;
    }


    //return : 解构式赋值，支持读取函数的全部或部分返回值。读取所有返回值：声明变量，并且将要赋值的变量用,隔开，按顺序排列。
    function returnMutiVarFromFun() public pure returns(string memory _name,bool _flag,uint _age){
        (_name,_flag,_age) = returnMutiVarNoReturnFun();
    }

    //return : 解构式赋值，支持读取函数的全部或部分返回值。读取部分返回值：声明要读取的返回值对应的变量，不读取的留空。
    function returnMutiVarFromFun2() public pure returns(string memory _name,uint _age){
        (_name,,_age) = returnMutiVarNoReturnFun();
    }



}