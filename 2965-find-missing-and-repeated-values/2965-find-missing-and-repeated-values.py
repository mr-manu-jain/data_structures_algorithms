class Solution:
    def findMissingAndRepeatedValues(self, grid: List[List[int]]) -> List[int]:
        hashmap = defaultdict(int)
        N = len(grid)

        for i in range(N):
            for j in range(N):
                hashmap[grid[i][j]]+=1
        double,missing = 0,0
        for num in range(1,N*N + 1):
            if hashmap[num] == 2:
                double = num
            elif hashmap[num] == 0:
                missing = num
        return [double,missing]
        # n = len(grid)
        # sett = set()
        # res = []
        # running_sum = 0
        # for row in range(n):
        #     for col in range(n):
        #         if grid[row][col] in sett:
        #             res[0].append(grid[row][col])
        #             running_sum+=grid[row][col]                   
        #         else:
        #             sett.add(grid[row][col])
        #             running_sum+=grid[row][col]

        # res[1] = running_sum - res[0] - (n*(n-1))/2 - 1