from typing import List
from collections import defaultdict
class Solution:
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        res, sol = [],[]
        counter = {}
        for num in nums:
            if num not in counter:
                counter[num] = 0
            counter[num]+=1

        N = len(nums)

        def backtrack():
            if len(sol) == N:
                res.append(sol[:])
                return

            for n in counter:
                if counter[n] > 0:
                    sol.append(n)
                    counter[n]-=1

                    backtrack()

                    counter[n]+=1
                    sol.pop()
        backtrack()
        return res


solu = Solution()
res = solu.permuteUnique([1,2,3])
print(res)
