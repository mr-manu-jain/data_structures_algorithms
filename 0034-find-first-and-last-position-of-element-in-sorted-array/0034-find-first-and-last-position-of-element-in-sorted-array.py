class Solution:
    def findFirst(self, nums, target):
        L,R = 0, len(nums)-1
        res = -1
        while L <= R:
            M = L+(R-L)//2

            if nums[M] == target:
                res = M
                R = M-1
            elif nums[M] < target:
                L = M+1
            else:
                R = M-1
        return res

    def findLast(self, nums, target):
        L,R = 0, len(nums)-1
        res = -1
        while L <= R:
            M = L+(R-L)//2

            if nums[M]==target:
                res = M
                L = M+1
            elif nums[M] < target:
                L = M+1
            else:
                R = M-1
        return res

    def searchRange(self, nums: List[int], target: int) -> List[int]:
        return [self.findFirst(nums,target), self.findLast(nums,target)]