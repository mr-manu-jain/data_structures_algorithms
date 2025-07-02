
from typing import List
from collections import defaultdict
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        hmap = defaultdict(int)
        for num in nums:
            if num in hmap:
                return True
            else:
                hmap[num]+=1
        return False      

solu = Solution()
res = solu.containsDuplicate([1,2,3,1])
print(res)
