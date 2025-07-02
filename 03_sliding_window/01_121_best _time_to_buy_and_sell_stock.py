
from typing import List


class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        if not prices:
            return 0
        
        L,R = 0,1
        max_profit = 0
        while R < len(prices):
            if prices[L] < prices[R]:
                profit = prices[R]-prices[L]
                max_profit = max(profit, max_profit)
            
            else:
                L = R
            R+=1
        return max_profit


solu = Solution()
res = solu.maxProfit([7,1,5,3,6,4])
print(res)