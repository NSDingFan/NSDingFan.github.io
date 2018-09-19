
```python
class Solution:
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        def reverse(x):
            number = 0
            while x:
                number = 10*number + x%10
                x = int(x/10)
            return number
        
        return x>=0 and x == reverse(x)

    # def isPalindrome(self, x):
    #     """
    #     方式二: 使用字符串来进行处理
    #     """
    #     str_x = str(x)
    #     return str_x == str_x[::-1]
```

## 知识点：
Python切片
注意点： python2 python3 处理 除法时的不同