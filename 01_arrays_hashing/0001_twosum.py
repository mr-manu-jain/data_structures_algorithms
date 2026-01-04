
from typing import List
from collections import defaultdict
class Solution:
    def two_sum(self, nums: List[int], target:int) -> List[int]:
        hashmapp = {}
        for i,num in enumerate(nums):
            diff = target-num

            if diff in hashmapp:
                return [i,hashmapp[diff]]
            else:
                hashmapp[num] = i
            




solu = Solution()
res = solu.two_sum([2,7,11,15],target=9)
print(res)

res1 = solu.two_sum([3,2,4],target=6)
print(res1)

