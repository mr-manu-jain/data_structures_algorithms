class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        L = 0
        max_length = 0
        set_ = set()
        for R in range(len(s)):
            while s[R] in set_:
                set_.remove(s[L])
                L+=1

            set_.add(s[R])
            max_length = max(R-L+1, max_length)
        return max_length