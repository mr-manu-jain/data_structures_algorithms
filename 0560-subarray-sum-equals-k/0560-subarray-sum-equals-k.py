class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        res = 0
        curr_sum = 0
        prefix_sum = {0:1}

        for num in nums:
            curr_sum+=num
            difference = curr_sum-k
            res = res + prefix_sum.get(difference,0)
            prefix_sum[curr_sum] = 1+prefix_sum.get(curr_sum,0)
        return res