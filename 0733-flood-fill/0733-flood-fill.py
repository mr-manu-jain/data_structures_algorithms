class Solution:
    def floodFill(self, image: List[List[int]], sr: int, sc: int, color: int) -> List[List[int]]:
        ROWS,COLS = len(image), len(image[0])
        src_color = image[sr][sc]

        if color == src_color:
            return image
        
        def dfs(r,c):
            if image[r][c] == src_color:
                image[r][c] = color
                neighbours = [[r+1,c],[r-1,c],[r,c+1],[r,c-1]]

                for nr, nc in neighbours:
                    if nr>=0 and nr<ROWS and nc>=0 and nc<COLS:
                        dfs(nr,nc)
        
        dfs(sr,sc)
        return image