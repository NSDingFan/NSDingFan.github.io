---
title: LeetCode-907. 子数组的最小值之和 | Sum Of Subarray Minimums
data: 
top: 
comments: false
categories:
    - LeetCode
tags:
    - LeetCode
    - Python
    - Medium
---

> [题目链接](https://leetcode-cn.com/contest/weekly-contest-102/problems/sum-of-subarray-minimums/)

## 题目

给定一个整数数组 A，找到 min(B) 的总和，其中 B 的范围为 A 的每个（连续）子数组。

由于答案可能很大，因此返回答案模 10^9 + 7。

示例：

```
输入：[3,1,2,4]
输出：17
解释：
子数组为 [3]，[1]，[2]，[4]，[3,1]，[1,2]，[2,4]，[3,1,2]，[1,2,4]，[3,1,2,4]。 
最小值为 3，1，2，4，1，1，2，1，1，1，和为 17。
```

提示：

1. `1 <= A <= 30000`
2. `1 <= A[i] <= 30000`

## 解答
### 分析
### 方式一：


```
class Solution:
    def sumSubarrayMins(self, A):
        """
        :type A: List[int]
        :rtype: int
        """
```

## 扩展
### 解题中的问题
### 知识点

## 思考