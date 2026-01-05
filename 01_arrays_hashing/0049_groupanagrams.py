from typing import List
from collections import defaultdict
class Solution:
    def group_Anagram(self, strs: List[str]) -> List[List[str]]:
        hashmapp = defaultdict(list)
        for word in strs:
            char_count = [0]*26
            for char in word:
                char_count[ord(char)-ord('a')]+=1
            hashmapp[tuple(char_count)].append(word)
        
        return [v for k,v in hashmapp.items()]

solu = Solution()
res = solu.group_Anagram(["act","pots","tops","cat","stop","hat"])
print(res)