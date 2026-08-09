class Solution:
    def compress(self, chars: List[str]) -> int:
        L,R = 0,0

        while R < len(chars):
            group_length = 1
            while (R+group_length < len(chars) and chars[R+group_length] == chars[R]):
                group_length += 1
            
            chars[L] = chars[R]
            L+=1
            
            if group_length > 1:
                str_num = str(group_length)
                chars[L:L+len(str_num)] = list(str_num)
                L += len(str_num)
            
            R += group_length

        return L
        