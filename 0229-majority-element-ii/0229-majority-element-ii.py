class Solution:
    def majorityElement(self, nums: List[int]) -> List[int]:
        counter_ = Counter(nums)
        res = []
        for num,freq in counter_.items():
            if freq > len(nums)/3:
                res.append(num)


        return res