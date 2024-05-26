// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract LogicControl{

    //if-else
    function ifElseFun(uint _number) public pure returns(string memory _res){
        if(_number <= 100){
            _res = "Sorry, you almost won. Keep trying!";
        }else if(_number > 100 && _number <= 1000){
            _res = "Congratulations, you won!";
        }else{
            _res = "You didn't win.";
        }

        return _res;
    }

    //for 
    function forFun(uint _number) public pure returns(string memory _res){
        uint[5] memory numbers = [uint(11),33,55,77,99];
        
        for (uint i = 0; i < numbers.length; i++) 
        {
             if(_number == numbers[i]){
                 _res = "Congratulations, you won!";
                 break ;
            }else{
                _res = "You didn't win.";
                continue ;
            }
        }
    
        return _res;
    }
                                                                         
    //while
    function whileFun(uint _number) public pure returns(string memory _res){
        uint[5] memory numbers = [uint(11),33,55,77,99];
        uint i = 0; 
        _res = "You didn't win.";

        while  (i < numbers.length) 
        {
             if(_number == numbers[i]){
                 _res = "Congratulations, you won!";
                 break ;
            }
            i++;
        }
    
        return _res;
    }

    //do - while
    function doWhileFun(uint _number) public pure returns(string memory _res){
        uint[5] memory numbers = [uint(11),33,55,77,99];
        uint i = 0; 
        _res = "You didn't win.";
        do{
             if(_number == numbers[i]){
                 _res = "Congratulations, you won!";
                 break ;
            }
            i++;
        }while  (i < numbers.length);
        
    
        return _res;
    }
    //三元运算符
    
    function ternaryOperatorFun(uint _number) public pure returns(string memory _res){
        _res = _number >= 100 
        return _res;
    }
}