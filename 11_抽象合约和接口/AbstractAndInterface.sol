// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract AbstractAndInterface{

}

//人类
abstract contract Human{
    event log(string);

    uint legs = 2; //两条腿
    uint eyes = 2; //两只眼睛
    string name;
 
    //吃东西
    function eatingFood(string memory food) public{
        emit log(string(abi.encodePacked("eat some:",food)));
    }

    //排尿
    function urination() virtual public returns(string memory _urine);

}

//男性能力
interface Male{
    //射精
    function ejaculation() external returns(string memory _cum);

}

//女性能力
interface Female{
    //排卵
    function ovulation() external returns(string memory _ovum);
    //生孩子
    function birthToChild(uint _cum,uint _ovum) external returns(string memory _baby);
}


//男人
contract Man is Human,Male{
    //排尿,男人使用阴茎排尿
    function urination() override public returns(string memory _urine){
        _urine = "Man use their penis to urinate";
        emit log(_urine);
        return _urine;
    }

    //男人拥有了射精能力
    function ejaculation() override external returns(string memory _cum){
        _cum = "Man ejaculates hundreds of millions of sperm";
        emit log(_cum);
        return _cum;
    }

}


//女人
contract Woman is Human,Female{
    //排尿,女人使用阴道排尿
    function urination() override public returns(string memory _urine){
        _urine = "Women use vaginal urination";
        emit log(_urine);
        return _urine;
    }

    //女人拥有了排卵能力
    function ovulation() override external returns(string memory _ovum){
        _ovum = "Woman released 3 eggs";
        emit log(_ovum);
        return _ovum;
    }

    //女人拥有了生孩子的能力
    function birthToChild(uint _cum,uint _ovum) override external returns(string memory _baby){
        _cum + _ovum;  //精子 加 卵子  结合
        _baby = "Woman birth to a baby";
        emit log(_baby);
        return _baby;
    }
}
