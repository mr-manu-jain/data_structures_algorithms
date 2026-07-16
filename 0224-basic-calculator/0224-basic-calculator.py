class Solution:
    def calculate(self, s: str) -> int:
        stack = []
        operand = 0
        res = 0
        sign = 1

        for char in s:
            if char.isdigit():
                operand = (operand*10) +int(char)
            elif char == '+':

                res = res + (sign*operand)
                sign = 1
                operand = 0

            elif char == '-':
                res = res + (sign*operand)
                sign = -1
                operand = 0
            
            elif char == '(':
                stack.append(res)
                stack.append(sign)

                sign = 1
                res = 0
            
            elif char == ')':
                res = res + (sign*operand)
                res = res * stack.pop()
                res = res + stack.pop()

                operand = 0

        return res + (sign*operand)

