class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        max_length = 0 

        L = 0
        sett = set()
        for R in range(len(s)):
            while s[R] in sett:
                sett.remove(s[L])
                L+=1
            sett.add(s[R])
            curr_length = R-L+1
            max_length = max(max_length, curr_length)
        return max_length