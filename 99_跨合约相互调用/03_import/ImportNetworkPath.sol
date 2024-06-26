// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import 'https://github.com/OpenZeppelin/ethernaut/blob/master/contracts/src/levels/CoinFlip.sol';

//网络地址导入
contract ImportNetworkPath{
    
    CoinFlip c = new CoinFlip();

    function test() public  {
        c.consecutiveWins;
        new CoinFlip().flip(true);
    }
}