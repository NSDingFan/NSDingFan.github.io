---
title: LeetCode-189. 旋转数组 | Rotate Array
data: 2018-09-15 21:19:34
top: 
copyright: true
comments: true
categories:
    - LeetCode
    - Python Tips
tags:
    - Python 列表切片的总结
    - Python List之间复制的总结
    - Python
    - LeetCode-Easy
---
> [题目链接](https://leetcode-cn.com/problems/rotate-array)

## 题目
给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。

**示例：**
```
输入: [1,2,3,4,5,6,7] 和 k = 3
输出: [5,6,7,1,2,3,4]
解释:
向右旋转 1 步: [7,1,2,3,4,5,6]
向右旋转 2 步: [6,7,1,2,3,4,5]
向右旋转 3 步: [5,6,7,1,2,3,4]
```

<!-- more -->

说明:
尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
要求使用空间复杂度为 O(1) 的原地算法。

## 解答

### 分析 & 思路
题目为把数组向右移动k个位置，其实就相当于将数组的最后一个元素移动至数组首位，循环k次。同时由于题中没有给定k和nums的长度，所以要考虑到这两者长度的问题以及关系：
- k = 0
- len(nums) <=1
- k > len(nums)
当 k 大于数组的长度时，如果直接循环，多循环的几轮是没有意义的，所以只需要循环 k%len(nums) 次即可。 同时，由于是不断的将数组末端的值放至数组前端，所以也就是将数组末尾的k个值拼接到剩余元素的前端。

通过以上思路，有两种方式：
1. 循环
2. 利用切片进行修改

---
第三种思路是直接对数组通过三次翻转来解决，首先将整个数组翻转, 然后将需要前k个元素进行翻转，然后将剩下的部分翻转，这样也相当于完成了k个位置的循环。同样，这里也要考虑k大于数组长度的问题。

```
输入: [1, 2, 3, 4, 5, 6, 7] 和 k = 3
输出: [5, 6, 7, 1, 2, 3, 4]

翻转整个列表: [7, 6, 5, 4, 3, 2, 1]
将前k个元素翻转: [5, 6, 7, 4, 3, 2, 1]
将剩余元素翻转: [5, 6, 7, 1, 2, 3, 4]
```
翻转整个列表，可以使用python内置的reverse函数解决。翻转部分列表，需要自定义一个函数。


### 方式一(循环)：

```py
class Solution:
    def rotate(self, nums, k):
        length = len(nums)
        for i in range(k % length):
            nums.insert(0,nums[-(i+1)])
        nums[:] = nums[:length]
```

### 方式二(切片)：

```python
class Solution:
    def rotate(self, nums, k):
        length = len(nums)
        i = k % length
        nums[:] = nums[-i:] + nums[:-i]
```

### 方式三(翻转部分元素)：

```python
class Solution:
    def rotate(self, nums, k):
        k %= len(nums)
        nums.reverse()
        self.reverse(nums, 0, k - 1)
        self.reverse(nums, k, len(nums) - 1)

    def reverse(self, nums, start, end):
        """
        nums: list
        start: int
        end: int
        """
        while start < end:
            temp = nums[end]
            nums[end] = nums[start]
            nums[start] = temp
            start += 1
            end -= 1
```


## 扩展

### 解题中出现的问题：

1. 关于list的值传递和地址传递
    由于自己的生疏，错误的使用了传地址的方式给list赋值，导致修改了list所指向的内存，而不是修改了原本所指内存的内容，所以出现了无法修改函数外传入的数组 这样的问题。

2. 关于 k > len(nums) 情况的处理：
    * 开始考虑过：
    	```python
    	if len(nums) < k:
    		k = k - len(nums)
    	```
    	这样存在问题: k 可能会大于 length 很多倍。
    	> 经过分析，这种方式并不妥当。例如当`nums = [1,2] k = 5`时，就会出现问题，预期结果为`[2,1]`，而实际结果为`[1,2]`。
    	>
    	> 但是在我试着这种方式提交后，显示提交答案通过，在查看其它通过的结果中也有相似的操作。这个应该是LeetCode测试用例不完善出现的问题。
    	
    * 通过循环解决：
    	就是上面的判断丢在循环里。同时加上了 `if k != 0 and len(nums) > 1 and k != len(nums)` 这样的判断。
    	>这种方式可行，但是并不是最优解。
    * 直接利用求余运算`%`解决：
    	```
    	length = len(nums)
            i = k % length
    	```

### 知识点：

#### 1. Python 列表切片的总结：

```
class slice(start, stop[, step])
```

##### 参考：
1. 关于回文素数的题目，生成回文数中有进行使用
2. [廖雪峰Python教程](https://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/0013868196352269f28f1f00aee485ea27e3c4e47f12bc7000)
3. [官方文档](https://docs.python.org/3.6/library/functions.html?highlight=slice#slice)

##### 切片初步：

切片 `list[x:y]` 范围为 x 到 y-1. 若未指定 x, 则默认x为0. 若未指定x或y, 则默认为获取第x个元素之后的所有元素或者前y个元素. 切片也可在 for 中进行使用.

```py
L = [1,2,3,4,5]
print(L[0:2]) # 获取list中前两个元素.
print(L[:2])
# --结果--
# [1, 2]
# [1, 2]

print(L[2:]) # 获取list中第二个元素后的所有元素.
# --结果--
# [3, 4, 5]
```

x 或者 y 可以为正整数或者负整数。当为负时，表示列表的倒数第n个元素。

```py
L = [1,2,3,4,5]
print(L[:-2]) # 获取列表倒数第二个元素以前的所有元素
# --结果--
# [1, 2, 3]

print(L[-3:-1]) # 获取倒数第三个元素到倒数第一个元素以前的元素
# --结果--
# [3, 4]
```
> 注意：默认情况下，x 必须要小于 y。

##### 切片进阶：
切片`list[x:y:z]`方法还有第三个参数z，用于指定步长。步长可以为正或者负。当步长为负时，需要 x 大于 y。

```py
L = [1,2,3,4,5]
print(L[::-1]) # 获取L所有元素的倒序结果
# --结果--
# [5, 4, 3, 2, 1]

print(L[2:5:-1])
# --结果--
# []

print(L[:-4:-1]) # 获取从列表开头到倒数第四个元素之间的元素
# --结果--
# [5, 4, 3]

print(L[::2])
# --结果--
# [1, 3, 5]
```


#### 2. Python中的List之间复制的总结

##### 1. 修改地址：

直接使用“`=`”进行赋值，会进行地址传递，例如`listB=listA`，就是将`listA`的地址传给了`listB`，对`listB`的地址进行的修改。这里的`listB`，无论是空还是非空，结果都是一样的。**这时无论是对`listA`还是`listB`进行修改，都是对同一块内存进行修改。**

如果不想将`listA`的地址传递给`listB`，只想将`listA`的值传递给`listB`，则可以通过`listB=listA[:]`这样的方式解决。这样的操作，**就是首先将`listA`的内容复制一份，然后将这个复制的内容的地址给到`listB`，这时`listA`和`listB`就指向了各自的地址，不会相互影响了。**

###### 首先看一下上面两种赋值方式，listA和listB的地址：

```py
print(id(listA))
listB = listA
print(id(listB))
listB = listA[:]
print(id(listB))
# --结果--
# 4557213320
# 4557213320
# 4558224264
```
> 显然，`listB = listA`只是地址的传递，而`listB=listA[:]`则是将`listA`的内容复制一份后，将复制内容的地址传给了`listB`。

###### 1.1 `listA = listB`的例子：

```python
listA = [1, 2, 3]
```
    
```py
# 建立B的同时将A地址传给B
listB = listA
listA.append(233)
print(listB)
# --结果--
# [1, 2, 3, 233]
```
    
```py
# 先建立B，然后再将A地址传递给B
listB = []
listB = listA 
listA.append(233)
print(listB)
# --结果--
# [1, 2, 3, 233]
```
    
```py
# 先建立B并赋值,然后将A的地址传给B
listB = [4, 5, 6]
listB = listA
listA.append(233)
print(listB)
# --结果--
# [1, 2, 3, 233]
```

```py
# 这里先将A的地址赋给了B, 然后通过=,又将[4,5,6]的地址赋给了A
listB = listA
listA = [4, 5, 6] 
print(listA)
print(listB)
# --结果--
# [4, 5, 6]
# [1, 2, 3]
```
    
```py
listC = listB = listA
listC.append(1234)
print(listA)
# --结果--
# [1, 2, 3, 1234]
```

###### 1.2 `listB = listA[:]` 的例子：

```py
listA = [1, 2, 3]
```

```py
listB = listA[:] # 将A的内容复制一份，给到B
listA.append(233)
print(listB)
# --结果--
# [1, 2, 3]
```

```py
listB = []
listB = listA[:]
listA.append(233)
print(listB)
# --结果--
# [1, 2, 3]
```

```py
listB = [4, 5, 6]
listB = listA[:]
listA.append(233)
print(listB)
# --结果--
# [1, 2, 3]
```

##### 2. 修改内存：
如果只是想要修改`listB`的内存，而不是需改其所指向内存。就需要通过`listB[:] = listA` 来实现。注意：这里的`listB`需要先进行定义，因为没法给一个不存在的地址进行赋值╮(╯▽╰)╭

###### 各种赋值方式的结果和地址：

```py
listA = [1, 2, 3]
listB = []
print("A: " + str(listA))
print("B: " + str(listB))
print("id of A: " + str(id(listA)))
print("id of B: " + str(id(listB)))

print("\n---1---\nlistB[:] = listA")
listB[:] = listA
print("id of B: " + str(id(listB)))
print("B: " + str(listB))

print("\n---2---\nlistB[:] = listA[:]")
listB[:] = listA[:]
print("id of B: " + str(id(listB)))
print("B: " + str(listB))

print("\n---3---\nlistB = listA")
listB = listA
print("id of B: " + str(id(listB)))
print("B: " + str(listB))

print("\n---4---\nlistB = listA[:]")
listB = listA[:]
print("id of B: " + str(id(listB)))
print("B: " + str(listB))
```

```py
# --结果--
A: [1, 2, 3]
B: []
id of A: 4390356616
id of B: 4390356744

---1---
listB[:] = listA
id of B: 4390356744
B: [1, 2, 3]

---2---
listB[:] = listA[:]
id of B: 4390356744
B: [1, 2, 3]

---3---
listB = listA
id of B: 4390356616
B: [1, 2, 3]

---4---
listB = listA[:]
id of B: 4390384200
B: [1, 2, 3]
```


##### 3. 在函数中修改：
要通过函数对一个函数外的list进行修改，就必须使用 `listB[:] = listA` 这种方式，修改list所指向内存的值。

###### 3.1 通过 `listB[:] = listA` 的方式：
所以如果需要通过函数对一个list进行修改，就需要通过 `listB[:] = listA` 这样的方式实现。

```py
listB = []
print("B: " + str(listB))
print("id of B: " + str(id(listB)) + "\n")


def changeB(listX):
    print("in function:")
    print("listX in func: " + str(listX))
    print("id of listX in func: " + str(id(listX)))
    listA = [1, 2, 3]
    print("listA in func: " + str(listA))
    print("id of listA in func: " + str(id(listA)))
    listX[:] = listA # 这里只修改listX所指向内存的值
    print("listX in func: " + str(listX))
    print("id of listX in func: " + str(id(listX)) + "\n")


changeB(listB)
print("B: " + str(listB))
print("id of B: " + str(id(listB)))

# --结果--
# B: []
# id of B: 4331075080

# in function:
# listX in func: []
# id of listX in func: 4331075080
# listA in func: [1, 2, 3]
# id of listA in func: 4331102408
# listX in func: [1, 2, 3]
# id of listX in func: 4331075080

# B: [1, 2, 3]
# id of B: 4331075080
```

###### 3.2 通过 `listB = listA`的方式:
因为函数中的变量指向的内存在函数执行完毕后，会被释放，也就是说函数内变量的作用域只在函数内。**所以不能通过 `listB = listA` 将函数中的list的地址传递给函数外的变量。注：同理，`listB = listA[:]` 这种方式，也不可以。**


```py
listB = []
print("B: " + str(listB))
print("id of B: " + str(id(listB)) + "\n")


def changeB(listX):
    print("in function:")
    print("listX in func: " + str(listX))
    print("id of listX in func: " + str(id(listX)))
    listA = [1, 2, 3]
    print("listA in func: " + str(listA))
    print("id of listA in func: " + str(id(listA)))
    listX = listA
    print("listX in func: " + str(listX))
    print("id of listX in func: " + str(id(listX)) + "\n")


changeB(listB)
print("B: " + str(listB))
print("id of B: " + str(id(listB)))

# --结果--
# B: []
# id of B: 4385576456

# in function:
# listX in func: []
# id of listX in func: 4385576456
# listA in func: [1, 2, 3]
# id of listA in func: 4385578696
# listX in func: [1, 2, 3]
# id of listX in func: 4385578696

# B: []
# id of B: 4385576456
```