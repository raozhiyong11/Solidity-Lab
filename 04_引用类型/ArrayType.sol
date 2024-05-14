// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ArrayType{

    //数组，分为“固定长度数组”和“可变长度数组”

    //1、固定长度数组:声明的时候指定长度
    uint[2] counts;
    string[3] names;
    address[3] addresss;



    //2、可变长度数组：申明的时候不指定长度
    uint[] counts2;
    string[] names2;
    address[] addresss2;
    //bytes 比较特殊,是数组，可以不用添加[], 声明单个字节数组不能使用byte[]，可以使用bytes或者byte1[]
    bytes vars;  //这种方式gas低
    bytes1[] vars2;  //因为bytes1[]在memory中要增加31个字节进行填充，会产生额外的gas。但是在storage中，由于内存紧密打包，不存在字节填充

    //3、数组创建规则
    // 3.1 memory修饰的数组，可以new 一个数组，并指定长度，后续不能改变数组长度
    function memoryCreateArray() pure public returns(uint[] memory _counts){
        uint[] memory count3 = new uint[](2);
        count3[0] = 1;
        count3[1] = 2;
        // 现在你可以使用 count3 数组，但不能使用 push() 方法
        
        //count3[2] = 3;  //固定了长度，如果再添加执行过程会报错："error": "Failed to decode output: Error: overflow

        _counts = count3;
    }

    // 3.2 memory修饰的数组，可以new 一个数组，并指定长度，后续不能改变数组长度
    uint[] public count4;
    function storageCreateArray()  public returns(uint[] memory _counts){
        count4.push(11);
        count4.push(22);
        count4.push(33);
        _counts = count4;
    }


    // 3.3 数组每一个元素的type是以第一个元素为准的
    ////这里所有的元素都是uint8类型，因为在solidity中如果一个值没有指定type的话，默认就是最小单位的该type，这里int的默认最小单位类型就是uint8
    uint[3] count5 = [1,2,3]; 
    //而[[uint(6),7,8]里面的元素都是uint类型，因为第一个元素指定了是uint类型了，都以第一个元素为准。 
    uint[3] count6 = [uint(6),7,8];

    function calc() public pure returns(uint _result){
        //计算数组之和
        //add([4,5,6]);  //没有显式对第一个元素进行uint强转的话，是会报错,类型错误：函数调用中参数的类型无效。  请求的从 uint8[3] 内存到 uint256[3] 内存的隐式转换无效。
        return add([uint(4),5,6]);
    }

    function add(uint[3] memory _nums) internal pure returns(uint _result){
        _result = _nums[0]+_nums[1]+_nums[2];
    }


    // 4 数组的成员
    function arrayAttrs() public returns(uint[] memory _counts){
        count4.length;//长度
        count4.push();//用于动态数组和bytes,在数组最后追加0元素；
        count4.push(88); //用于动态数组和bytes,在数组最后追加指定元素；
        count4.push(77);
        count4.push(66);
        count4.push();
        count4.pop(); //用于动态数组和bytes,从数组最后移除一个元素；
        _counts = count4;

        //输出结果：	{	"0": "uint256[]: _counts 0,88,77,66" }
    }



}