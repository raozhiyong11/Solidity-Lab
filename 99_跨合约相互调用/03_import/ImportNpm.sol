// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//我们在使用 Remix、Hardhat、Foundry  等集成开发和测试框架中，可以使用 import 引用 npm 下载到本地的依赖包。
//import 使用 @ 符号加上包名和文件名的方式，来引入需要的合约文件
contract ImportNpm is ERC20{

    constructor() ERC20("ImportNpm","INPM"){
        _mint(msg.sender,100*10*10);
    }

}