from typing import List
from collections import defaultdict
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s)!= len(t):
            return False

        hashmapp = defaultdict(int)
        hashmapp1 = defaultdict(int)
        for i in range(len(s)):
            hashmapp[s[i]] += 1
            hashmapp1[t[i]] += 1
        
        for char in s:
            if hashmapp[char] != hashmapp1[char]:
                return False
        return True
        

solu = Solution()
res = solu.isAnagram("anagram","nagaram")
print(res)