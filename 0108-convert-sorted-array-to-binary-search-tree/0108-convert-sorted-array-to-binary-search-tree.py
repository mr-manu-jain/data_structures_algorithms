# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def createBinaryTree(self, left, right, nums):
        if left > right: return None

        m = (left+right)//2

        root = TreeNode(nums[m])
        root.left = self.createBinaryTree(left, m-1, nums)
        root.right = self.createBinaryTree(m+1, right, nums)
        return root
    def sortedArrayToBST(self, nums: List[int]) -> Optional[TreeNode]:
        return self.createBinaryTree(0, len(nums)-1, nums)
        