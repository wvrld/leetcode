/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        dfs(root, level: 0, ans: &ans)
        return ans
    }


    private func dfs(_ node: TreeNode?, level: Int, ans: inout [[Int]]) {
        guard let node = node else { return }
        if ans.count <= level { ans.append([Int]()) }

        if level % 2 == 0 {
            ans[level].append(node.val)
        } else {
            ans[level].insert(node.val, at: 0)
        }

        dfs(node.left, level: level + 1, ans: &ans)
        dfs(node.right, level: level + 1, ans: &ans)
    }

}