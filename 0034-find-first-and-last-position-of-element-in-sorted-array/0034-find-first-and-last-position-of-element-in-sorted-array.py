class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        begin,end = 0,len(nums)-1

        while begin < end:
            mid = (begin + end) // 2

            if nums[mid] > target:
                end = mid-1
            elif nums[mid] < target:
                begin = mid+1
            elif nums[mid] == target:
                i,j = mid,mid

                while i>0 and nums[i] == target:
                    i-=1
                while j<len(nums)-1 and nums[j] == target:
                    j+=1


                left = i+1 if nums[i]!= target else i
                right = j-1 if nums[j]!=target else j
                
                return [left,right]
        if begin == end and nums[begin] == target:
                    return [begin,begin]
        return [-1,-1]

                




