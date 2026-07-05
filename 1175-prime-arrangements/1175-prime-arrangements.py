class Solution:
    def numPrimeArrangements(self, n: int) -> int:
        MOD = 10**9 + 7

        primes = [1]* (n+1)
        primes[0],primes[1] = 0,0
        for i in range(2,int(n**0.5)+1):
            if primes[i] == 1:
                for multiple in range(i*i, n+1, i):
                    primes[multiple] = 0
        k = sum(primes)

        return (math.factorial(k) * math.factorial(n-k)) % MOD
#find the number of prime which would be there between 1 to n
# fix their positions
#possible permutations would be n-count
# 1 to 5, 1,2,3,4,5 ; #primes = 2 {3,5} ; 5-2 = 3; (3*2)/ 
# prime can be chosen in n!/primes!
# non primes can be chose in (n-k)!
# total - prime+non prime