from typing import List
from collections import defaultdict



class Solution:
    def isPalindrome(self, s: str) -> bool:
        L,R = 0, len(s)-1

        while L < R:
            while L < R and not s[L].isalnum():
                L+=1

            while L < R and not s[R].isalnum():
                R-=1

            if s[L].lower() != s[R].lower():
                return False
        
            L+=1
            R-=1
        return True
solu = Solution()
s = "A man, a plan, a canal: Panama"
#s = " "
res = solu.isPalindrome(s)
print(f"{s} -> Palindrome Status: {res}")
