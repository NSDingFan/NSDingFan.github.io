---
title:  LeetCode-908. 最小差值 I | Smallest Range I | max()
data: 2018-09-23
top: 
comments: true
copyright: true
categories:
    - LeetCode
    - Python Tips
tags:
    - LeetCode
    - Python 內建函数 max()
---

> [题目链接](https://leetcode-cn.com/problems/smallest-range-i/)

## 题目

给定一个整数数组 `A`，对于每个整数 `A[i]`，我们可以选择任意 `x` 满足 `-K <= x <= K`，并将 x 加到 `A[i]` 中。
在此过程之后，我们得到一些数组 `B`。
返回 `B` 的最大值和 `B` 的最小值之间可能存在的最小差值。


在此过程之后，我们得到一些数组 B。

返回 B 的最大值和 B 的最小值之间可能存在的最小差值。

示例 1：
```
输入：A = [1], K = 0
输出：0
解释：B = [1]
```
<!-- more -->
示例 2：
```
输入：A = [0,10], K = 2
输出：6
解释：B = [2,8]
```

示例 3：
```
输入：A = [1,3,6], K = 3
输出：0
解释：B = [3,3,3] 或 B = [4,4,4]
```

提示：
1. `1 <= A.length <= 10000`
2. `0 <= A[i] <= 10000`
3. `0 <= K <= 10000`


## 解答
### 分析
由于题目中说可以选择 `-k` 到 `k` 之间的任意 `x`，所以，我们就可以对 `A[i]` 进行最大 `+x` 或者 `-x` 的处理，所以就可以影响数组A中元素之间大小为 `2x` 的差值，当两个元素小于 `2x` 时，我们可以使其差值变为0，当差值大 `2x` 时，可以使差值最大缩小为 `A[i]-A[j]-2x`。
### 方式一：

```py
class Solution:
    def smallestRangeI(self, A, K):
        """
        :type A: List[int]
        :type K: int
        :rtype: int
        """
        x = max(A) - min(A)
        y = 2 * K
        if x <= y:
            return 0
        else:
            return x - y
```
### 方式二：

上面方法的简写

```py
class Solution:
    def smallestRangeI(self, A, K):
        """
        :type A: List[int]
        :type K: int
        :rtype: int
        """
        return max(0,max(A)-min(A)-2*K)
```

## 扩展
### 知识点
#### Python max()函数
[官方文档链接](https://docs.python.org/3.6/library/functions.html#max)

`max(iterable, *[, key, default])`
`max(arg1, arg2, *args[, key])`

max()方法返回给定迭代中的最大值，或者返回多个给定参数中最大的参数：
> 注意：
> - 可以是任何`同类型`的元素，比如多个列表，多个字符串等
> - 如果给定单个非迭代参数，会报错
> - 给出的迭代为空时，如果没有指定default参数，会报错

##### key：
可以提供一个匿名函数用来对需要进行比较的内容进行预处理。例如调整大小写，或者指定比较一个多个元祖的第几个元素等。
更多匿名函数的内容，可以参考：
- 我另外一篇blog总结：[按奇偶校验排序数组 #匿名函数](https://nsdf.top/leetcode-905-按奇偶校验排序数组-sort-array-by-parity-list-sort-lambda.html#2-匿名函数：)
- Python官方文档：[lambda-expressions](https://docs.python.org/3/tutorial/controlflow.html#lambda-expressions)



##### default:

就是当提供的单一迭代参数为空时，所指定的默认返回值。如果没有指定的话，则报错ValueError。
例：

```py
# default参数的使用
C = []
print(max(C, default='DF'))
------------
结果：
DF
```

```
# 不指定default
C = []
print(max(C))
-------------
发生异常: ValueError
max() arg is an empty sequence
```


还有一份蛮不错的笔记，转载一下：
来自 RUNOOB.COM 的笔记：http://www.runoob.com/python/func-number-max.html
```python
>>> a='1,2,3,4'
>>> type(a)             #类型为字符串
<type 'str'>
>>> max(a)              #max 返回了最大值
'4'
>>> a=[1,2,3,4]
>>> type(a)             #类型是列表
<type 'list'>
>>> max(a)              #max函数也返回了最大值
4
>>>
>>>
>>> a=[(1,2),(2,3),(3,4)]                #假设列表里面是元组构成元素呢
>>> max(a)                                     #按照元素里面元组的第一个元素的排列顺序，输出最大值（如果第一个元素相同，则比较第二个元素，输出最大值）据推理是按ascii码进行排序的
(3, 4)
>>> a=[('a',1),('A',1)]                     #实验推测是按ascii码进行排序，比较  a  和   A 的值，得出a > A   ,  因为ascii 码里面，按照排列顺序 小 a在 A的后面
>>> max(a)
('a', 1)
>>> a=[(1,2),(2,3),(3,1)]
>>> a=[(1,3),(2,2),(3,1)]                #列表里面的元素都由元组构成，元组都由数字组成，输出最大值
>>> max(a)
(3, 1)
>>> a=[(1,3),(2,2),(3,1),(3,1)]
>>> max(a)
(3, 1)
>>> a=[(1,3),(2,2),(3,1),(3,2)]
>>> max(a)
(3, 2)
>>> 
>>> a=[(1,3),(2,2),(3,1),(3,'b'),('a',1)]
>>> max(a)
('a', 1)
>>> a=[(1,3),(2,2),(3,1),(3,'b'),('a',1),('f',3)]
>>> max(a)
('f', 3)
>>> 
>>> a={1:2,2:2,3:1,4:'aa'}                  #比较字典里面的最大值，会输出最大的键值
>>> max(a)
4
```
