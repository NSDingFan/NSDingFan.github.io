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
def containsDuplicate(nums):
    # if len(nums) != len(set(nums)):
    #     return True
    # else:
    #     return False

    # 更快的一个写法:
    return len(nums) != len(set(nums))


# nums = [1, 2, 3, 1]
# nums = [1,2,3,4]
nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
print(containsDuplicate(nums))

```