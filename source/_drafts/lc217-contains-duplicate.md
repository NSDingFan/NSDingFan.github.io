
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