from typing import List
from collections import defaultdict



class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        ans = []
        nums.sort()

        for a in range(len(nums)):
            if a!=0 and nums[a] == nums[a-1]:
                continue
            
            b,c = a+1, len(nums)-1

            while b < c:
                threeSum = nums[a] + nums[b]+nums[c]

                if threeSum > 0 :
                    c-=1
                elif threeSum < 0 :
                    b+=1
                else:
                    ans.append([nums[a],nums[b],nums[c]])
                    
                    b+=1
                    while nums[b]==nums[b-1] and b<c:
                        b+=1
        return ans

solu = Solution()
res = solu.threeSum([-1,0,1,2,-1,-4])
print(res)
