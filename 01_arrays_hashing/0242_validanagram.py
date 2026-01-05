from typing import List
from collections import defaultdict
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:

        if len(s) != len(t): return False

        s_count = [0]*26
        t_count = [0]*26

        for i in range(len(t)):
            s_count[ord(s[i])-ord('a')]+=1
            t_count[ord(t[i])-ord('a')]+=1
        print(s_count,t_count)
        return "".join(map(str,s_count)) == "".join(map(str,t_count))
    

    #Further optimisation
    def is_Anagram_Optimized(self, s: str, t: str) -> bool:
        if len(s) != len(t): return False
        char_count = [0]*26
        for i in range(len(t)):
            char_count[ord(s[i])-ord('a')]+=1
            char_count[ord(t[i])-ord('a')]-=1

        for char in char_count:
            if char!=0:
                return False
        return True

    
        

solu = Solution()
res = solu.isAnagram("anagram","nagaraaam")
print(res)


res1 = solu.is_Anagram_Optimized("anagram","nagaram")
print(res1)