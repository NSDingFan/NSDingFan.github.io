---
title:
date:
top: # 新增,置顶. 默认为空
copyright: true # 新增,自定义版权,默认开启
comments: true # 评论 开启
categories:
tags:
---
```python
class Solution:
    def transpose(self,A):
        x = len(A)
        y = len(A[0])
        new_A = []
        for i in range(y):
            list_a = []
            for j in range(x):
                Aj = A[j]
                a = Aj[i]
                list_a.append(a)
            new_A.append(list_a)
        return new_A[:]
```