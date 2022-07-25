/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var ans = ""
        guard root != nil else { return ans }
        var queue: [TreeNode?] = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if node != nil{
                ans += String(node!.val) + ","
                queue.append(node!.left)
                queue.append(node!.right)
            } else {
                ans += "#,"
            }
        }
        
        return ans
    }
    
    
    func deserialize(_ data: String) -> TreeNode? {
        let arr = data.split(separator: ",")
        guard !arr.isEmpty else { return nil }
        
        let root = TreeNode(Int(String(arr[0]))!)
        var queue = [TreeNode]()
        queue.append(root)
        var index = 0, leftNode = true
        
        for i in 1..<arr.count{
            
            if String(arr[i]) != "#" {
                let node: TreeNode = TreeNode(Int(String(arr[i]))!)
                if leftNode {
                    queue[index].left = node
                } else {
                    queue[index].right = node
                }
                queue.append(node)
            }
            
            if !leftNode { index += 1 }
            leftNode = !leftNode
        }
        
        return root
    }

}


// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))