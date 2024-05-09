## Solidity中的函数
solidity官方文档里把函数归到数值类型，但我觉得差别很大，所以单独分一类。我们先看一下solidity中函数的形式：
```solidity
    function <function name>(<parameter types>) {internal|external|public|private} [pure|view|payable] [returns (<return types>)]
```

看着些复杂，咱们从前往后一个一个看（方括号中的是可写可不写的关键字）：

`function`：声明函数时的固定用法，想写函数，就要以function关键字开头。

`<function name>`：函数名。

`(<parameter types>)`：圆括号里写函数的参数，也就是要输入到函数的变量类型和名字。

`{internal|external|public|private}`：函数可见性说明符，一共4种。没标明函数类型的，默认public。合约之外的函数，即"自由函数"，始终具有隐含internal可见性。

- `public`: 内部外部均可见。
- `private`: 只能从本合约内部访问，继承的合约也不能用。
- `external`: 只能从合约外部访问（但是可以用this.f()来调用，f是函数名）。
-  `internal`: 只能从合约内部访问，继承的合约可以用。

**Note 1**: 没有标明可见性类型的函数，默认为public。

**Note 2**: public|private|internal 也可用于修饰状态变量。 public变量会自动生成同名的getter函数，用于查询数值。

**Note 3**: 没有标明可见性类型的状态变量，默认为internal。

`[pure|view|payable]`：决定函数权限/功能的关键字。payable（可支付的）很好理解，带着它的函数，运行的时候可以给合约转入ETH。pure和view的介绍见下一节。

`[returns ()]`：函数返回的变量类型和名称。