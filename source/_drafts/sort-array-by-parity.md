---
title: LeetCode-905. 按奇偶校验排序数组 | Sort Array By Parity 
data: 
top: 
comments: false
categories:
    - LeetCode
tags:
    - LeetCode
    - Python
    - Easy

---

> [题目链接](https://leetcode-cn.com/contest/weekly-contest-102/problems/sort-array-by-parity/)

## 题目

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


## 解答
### 分析
### 方式一：


```
class Solution:
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

## 扩展
### 解题中的问题
### 知识点

## 思考