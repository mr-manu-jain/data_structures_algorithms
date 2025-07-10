
from typing import List


class Solution:
    def trap(self, height: List[int]) -> int:
        left_array = []
        lmax = 0

        for i in range(len(height)):
            if i == 0:
                left_array.append(0)
            lmax = max(lmax,height[i])   
            left_array.append(lmax)

        right_array = []
        
        rmax = 0
        for i in range(len(height)-1,-1,-1):
            if i == len(height)-1:
                right_array.append(0)
            rmax = max(rmax,height[i])   
            right_array.append(rmax)
        right_array = right_array[::-1]


        min_array = []
        for i in range(len(right_array)):
            min_array.append(min(left_array[i],right_array[i]))
        
        res = []
        for i in range(len(height)):

            if min_array[i] - height[i] < 0:
                res.append(0)
            else:
                res.append(min_array[i]-height[i])
        # print(height)
        # print(left_array)
        # print(right_array)
        # print(min_array)
        # print(res)
        return sum(res)




solu = Solution()
res = solu.trap([0,1,0,2,1,0,1,3,2,1,2,1])
print(res)
