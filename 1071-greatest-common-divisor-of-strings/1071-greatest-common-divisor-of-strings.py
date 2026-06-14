class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        N,M = len(str1), len(str2)
        
        def valid(t):
            if N%t !=0 or M%t != 0:
                return False
            
            N1, M1 = N//t, M//t
            base = str1[:t]

            return str1 == N1*base and str2==M1*base
            
        for i in range(min(M,N), 0, -1):
            if valid(i):
                return str1[:i]
        return ""
