class Solution:
    def singleNumber(self, nums: List[int]) -> List[int]:
        xorr = nums[0]
        for i in range(1,len(nums)):
            xorr^=nums[i]

        #and with the negative (2s compliment to get the difference in bit)
        diff_bit = xorr & -xorr
        first_num = 0
        second_num = 0
        for num in nums:
            if num & diff_bit == 0:
                first_num^=num
            else:
                second_num^=num

        return [first_num,second_num]


# 3-> 011
# 5-> 101
# ========
# 6-> 110