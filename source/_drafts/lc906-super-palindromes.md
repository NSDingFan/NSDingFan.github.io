---
title: LeetCode-906.超级回文数 | Super Palindromes
data: 
top: 
copyright: true
comments: false
categories:
    - LeetCode
tags:
    - LeetCode
    - Python
    - Hard
---

> [题目链接](https://leetcode-cn.com/contest/weekly-contest-102/problems/super-palindromes/)

## 题目
如果一个正整数自身是回文数，而且它也是一个回文数的平方，那么我们称这个数为超级回文数。

现在，给定两个正整数 `L` 和 `R` （以字符串形式表示），返回包含在范围 `[L, R]` 中的超级回文数的数目。

示例：

```
输入：L = "4", R = "1000"
输出：4
解释：
4，9，121，以及 484 是超级回文数。
注意 676 不是一个超级回文数： 26 * 26 = 676，但是 26 不是回文数。
```

提示：

* `1 <= len(L) <= 18`
* `1 <= len(R) <= 18`
* `L` 和 `R` 是表示 `[1, 10^18)` 范围的整数的字符串。
* `int(L) <= int(R)`


## 分析

## 解答

```
class Solution:
    def superpalindromesInRange(self, L, R):
        """
        :type L: str
        :type R: str
        :rtype: int
        """
        def isSupHw(x):
            y = int(x**.5)
            if y**2 == x:
                str_x = str(x)
                str_y = str(y)
                if str_x == str_x[::-1] and str_y == str_y[::-1]:
                    return True
            else:
                return False

        num = 0
        for i in range(int(L),int(R)):
            if isSupHw(i):
                num += 1
    
        return num
```

## 扩展

## 思考 & 总结