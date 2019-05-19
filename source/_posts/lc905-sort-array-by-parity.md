---
title: LeetCode-905. 按奇偶校验排序数组 | Sort Array By Parity | list.sort(),lambda
data: 2018-09-19
top: 
copyright: true
comments: true
categories:
    - LeetCode
    - Python Tips
tags:
    - Python
    - Python 排序函数 list.sort() 
    - Python 匿名函数 lambda
    - LeetCode-Easy
---

> [题目链接](https://leetcode-cn.com/problems/sort-array-by-parity/)

# 题目

给定一个非负整数数组 A，返回一个由 A 的所有偶数元素组成的数组，后面跟 A 的所有奇数元素。

你可以返回满足此条件的任何数组作为答案。

示例：

```
输入：[3,1,2,4]
输出：[2,4,3,1]
输出 [4,2,3,1]，[2,4,1,3] 和 [4,2,1,3] 也会被接受。
```

提示：

1. `1 <= A.length <= 5000`
2. `0 <= A[i] <= 5000`

<!--more-->

# 解答
## 分析
由于没有多余的要求，只需要建立一个数组B，通过循环对A的元素进行奇偶校验，然后根据元素为奇数或者偶数，分别插入到数组的尾部或者头部即可。

另外一种方式，就是通过while循环，直接对数组A进行原地修改。

最后，还可以利用python的sort()函数，对数组A进行排序。

## 解答
### 方式一：

```python
class Solution:
"""
方式一：直接根据元素的奇偶，插入到数组B的首部或尾部即可
"""
    def sortArrayByParity(self, A):
        """
        :type A: List[int]
        :rtype: List[int]
        """
        B = []
        for i in A:
            if i % 2 == 0:
                B.insert(0,i)
            else:
                B.insert(len(B),i)
        return B                
```
### 方式二：

```python
class Solution:
"""
方法二: 使用while,原地修改A数组,将数组中奇数元素移动到数组末端
"""
    def sortArrayByParity(self, A):
        """
        :type A: List[int]
        :rtype: List[int]
        """
        x = len(A)
        i = 0
        while x>0:
            if A[i] % 2 != 0:
                A.append(A.pop(i))
                x-=1  
            else:
                x -= 1
                i += 1
        return A 
```


### 方式三：

```python
class Solution:
    def sortArrayByParity(self, A):
        """
        :type A: List[int]
        :rtype: List[int]
        方法三：使用sort()方法
        """
        A.sort(key=lambda num:num%2)
        return A
        # return sorted(A,key=lambda num:num%2)
```
> 这里涉及两个知识点：
> - `list.sort()`
> - 匿名函数（lambda）


# 扩展

## 知识点:

### 1. list.sort()

**参考：**

官方文档：https://docs.python.org/3/howto/sorting.html
RUNOOB：http://www.runoob.com/python/att-list-sort.html
廖雪峰Python教程： [https://www.liaoxuefeng.com/wiki/...](https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/0014318230588782cac105d0d8a40c6b450a232748dc854000)

```
list.sort(cmp=None, key=None, reverse=False)
```

**一些基础知识：**

1. list.sort() 永久排序， sorted(list) 非永久排序。
2. list.sort() 只能用于数组，而 sorted() 可以用于所有迭代类型。
    
    ```python
    >>> sorted({1: 'D', 2: 'B', 3: 'B', 4: 'E', 5: 'A'})
[1, 2, 3, 4, 5]
    ```
1. reverse参数，控制排序的循序，默认为false。当reverse=True时，为倒序排序。

**key 参数的功能**

`sort()` 和 `sorted()` 都拥有的一个 `key` 参数，通过指定在进行比较之前对每个列表元素调用的函数，以实现自定义排序。

通过key参数，可以实现例如：
- 以一个复合列表中元素的第i个元素的值为依据进行排序
- 以忽略大小写的方式，对字符串进行排序
- 比较数组元素绝对值的大小
- 本题中，对数组进行奇偶校验排序
- ……

下面是几个例子：
- 例1：忽略大小写排序（引用自官方文档）

    ```python
    >>> sorted("This is a test string from Andrew".split(), key=str.lower)
    ['a', 'Andrew', 'from', 'is', 'string', 'test', 'This']
    ```
    > 通过指定str.lower 使得在排序前，先将列表中的元素转换为了小写。
    
- 例2：对数组绝对值进行排序（引用自廖旭峰的python教程）

    ```python
    >>> sorted([36, 5, -12, 9, -21])
    [-21, -12, 5, 9, 36]
    ```
- 例3：对一个保存学生信息的列表，按照学生年龄进行排序。（引用自官方文档）
    
    - 每个学生信息存储在一个子列表中
        
        ```python
        >>> student_tuples = [
        ...     ('john', 'A', 15),
        ...     ('jane', 'B', 12),
        ...     ('dave', 'B', 10),
        ... ]
        >>> sorted(student_tuples, key=lambda student: student[2])   # sort by age
        [('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
        ```
    - 每个学生信息存储在学生对象中：

        ```python
        >>> class Student:
        ...     def __init__(self, name, grade, age):
        ...         self.name = name
        ...         self.grade = grade
        ...         self.age = age
        ...     def __repr__(self):
        ...         return repr((self.name, self.grade, self.age))
        ```
        ```python
        >>> student_objects = [
        ...     Student('john', 'A', 15),
        ...     Student('jane', 'B', 12),
        ...     Student('dave', 'B', 10),
        ... ]
        >>> sorted(student_objects, key=lambda student: student.age)   # sort by age
        [('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
        ```


**排序稳定性和复合排序**
排序首先保证稳定，当多个元素（每个元素具有多个值）用于比较的项目的值相同时，会保留它们的原始顺序。这个有点可以在让python方便的进行复合排序。

```python
# 先对年龄进行升序排序，然后再对成绩进行降序排序。
>>> s = sorted(student_objects, key=attrgetter('age'))     # sort on secondary key
>>> sorted(s, key=attrgetter('grade'), reverse=True)       # now sort on primary key, descending
[('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
```
> 例子来自官方文档

**python2中使用的cmp参数**

这部分的官方文档链接：https://docs.python.org/3/howto/sorting.html#the-old-way-using-the-cmp-parameter

python2.x版本，提供了cmp参数，提供用于进行比较的相关功能。简单来书就是建立一个比较函数，通过返回值（大于0的数，等于0，小于0的数）来控制排序。
引用官方文档中给出的比较数字大小的例子

- 按照正序排列数组：
    
    ```python
    >>> def numeric_compare(x, y):
    ...     return x - y
    >>> sorted([5, 2, 4, 1, 3], cmp=numeric_compare) 
    [1, 2, 3, 4, 5]
    ```
- 按照倒序排列数组：
    
    ```python
    >>> def reverse_numeric(x, y):
    ...     return y - x
    >>> sorted([5, 2, 4, 1, 3], cmp=reverse_numeric) 
    [5, 4, 3, 2, 1]
    ```

在python3中cmp已经被完全移除了，如果取而代之的是key参数。
如果需要将python2的代码转到python3，只需使用下面的包装器，对适用于cmp的函数进行处理，使其适用于key即可：

```python
def cmp_to_key(mycmp):
    'Convert a cmp= function into a key= function'
    class K:
        def __init__(self, obj, *args):
            self.obj = obj
        def __lt__(self, other):
            return mycmp(self.obj, other.obj) < 0
        def __gt__(self, other):
            return mycmp(self.obj, other.obj) > 0
        def __eq__(self, other):
            return mycmp(self.obj, other.obj) == 0
        def __le__(self, other):
            return mycmp(self.obj, other.obj) <= 0
        def __ge__(self, other):
            return mycmp(self.obj, other.obj) >= 0
        def __ne__(self, other):
            return mycmp(self.obj, other.obj) != 0
    return K
```

要转换为key方法，只需要对原来的函数进行包装即可：

```python
>>> sorted([5, 2, 4, 1, 3], key=cmp_to_key(reverse_numeric))
[5, 4, 3, 2, 1]
```
在python3.2中，[`functools.cmp_to_key()`](https://docs.python.org/3/library/functools.html#functools.cmp_to_key "functools.cmp_to_key")函数已经添加到了基础库的 [`functools`](https://docs.python.org/3/library/functools.html#module-functools "functools: Higher-order functions and operations on callable objects.") 模块中。

```python
import functools

def numeric_compare(x, y):
    return x - y

nums = [2, 3, 1, 4, 5]
print(sorted(nums, key=functools.cmp_to_key(numeric_compare)))

---结果---
[1, 2, 3, 4, 5]
```


-------


### 2. 匿名函数：
官方文档：https://docs.python.org/3/tutorial/controlflow.html#lambda-expressions

直接用一个例子来解释：

```python
A = [3,1,2,4]
print(sorted(A,key=lambda num:num%2))
```

就相当于：

```python
def evenNumber(num):
    return num % 2

print(sorted(A, key=evenNumber))
```


# 思考
需要跟多的去阅读相关语言的文档，解题中遇到的很多问题，在对文档有了更多的了解后，会更容易解决。