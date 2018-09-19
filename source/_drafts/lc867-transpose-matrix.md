
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