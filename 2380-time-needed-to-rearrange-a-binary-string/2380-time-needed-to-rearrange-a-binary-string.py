class Solution:
    def secondsToRemoveOccurrences(self, s: str) -> int:
        ans, prefix, prev = 0,0,0

        for i,char in enumerate(s):
            if char == '1':
                ans = max(prev, i-prefix)
                prefix += 1
                if ans:
                    prev = ans+1
        return ans