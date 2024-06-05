// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract MultipleExtends{


}

/**  多重 砖石 继承
Grandfather
    / \
   /   \
Father  Uncle
   \    /
    \  /
     Son
      \
    Grandson
**/

contract Grandfather{
    event log(string name,string msg);

    string public name;
    int public age;
    //使用 virtual 声明此函数可以被重写
    function getFavorite() public virtual  returns(string memory _favorite){
        _favorite = "drink wine";
        emit log("Grandfather",_favorite);
    }

}

contract Father is Grandfather{
    //使用 override 表示覆盖父合约中的 函数
    function getFavorite() public virtual override returns(string memory _favorite){
        _favorite = super.getFavorite();
        _favorite = "reading...";
        emit log("Father",_favorite);
    }
}

contract Uncle is Grandfather{
    //使用 override 表示覆盖父合约中的 函数
    function getFavorite() public virtual override returns(string memory _favorite){
        _favorite = super.getFavorite();
        _favorite = "running...";
        emit log("Uncle",_favorite);
    }
}

//继承时要按辈分最高到最低的顺序排,否则编译报错
contract Son is Grandfather,Father,Uncle{
    //如果某一个函数在多个继承的合约里都存在，在子合约里必须重写，不然会报错:Derived contract must override function "getFavorite". Two or more base classes define function with same name and parameter types.
    //重写在多个父合约中都重名的函数时，override关键字后面要加上所有父合约名字，例如override(Grandfather,Father) 
    function getFavorite() public virtual  override(Grandfather,Father,Uncle)  returns(string memory _favorite){
        _favorite = super.getFavorite();
        _favorite = "play basketball";
        emit log("Son",_favorite);
    }

}

//在面向对象编程中，钻石继承（菱形继承）指一个派生类同时有两个或两个以上的基类。
//在多重+菱形继承链条上使用super关键字时，需要注意的是使用super会调用继承链条上的每一个合约的相关函数，而不是只调用最近的父合约。
contract Grandson is Grandfather,Father,Uncle,Son{
    function getFavorite() public override(Grandfather,Father,Uncle,Son) returns(string memory _favorite){
       _favorite = super.getFavorite();
       emit log("Grandson",_favorite);
    }

}

/**
[
	{
		"from": "0x876197308cAebE9E0DE88c703608D33598E2c058",
		"topic": "0x4b5c4277d556d03fbf5ee534fba41dc13982b44f2fa82f1d48fdd8b5b5b692ac",
		"event": "log",
		"args": {
			"0": "Grandfather",
			"1": "drink wine",
			"name": "Grandfather",
			"msg": "drink wine"
		}
	},
	{
		"from": "0x876197308cAebE9E0DE88c703608D33598E2c058",
		"topic": "0x4b5c4277d556d03fbf5ee534fba41dc13982b44f2fa82f1d48fdd8b5b5b692ac",
		"event": "log",
		"args": {
			"0": "Father",
			"1": "reading...",
			"name": "Father",
			"msg": "reading..."
		}
	},
	{
		"from": "0x876197308cAebE9E0DE88c703608D33598E2c058",
		"topic": "0x4b5c4277d556d03fbf5ee534fba41dc13982b44f2fa82f1d48fdd8b5b5b692ac",
		"event": "log",
		"args": {
			"0": "Uncle",
			"1": "running...",
			"name": "Uncle",
			"msg": "running..."
		}
	},
	{
		"from": "0x876197308cAebE9E0DE88c703608D33598E2c058",
		"topic": "0x4b5c4277d556d03fbf5ee534fba41dc13982b44f2fa82f1d48fdd8b5b5b692ac",
		"event": "log",
		"args": {
			"0": "Son",
			"1": "play basketball",
			"name": "Son",
			"msg": "play basketball"
		}
	}
]


**/