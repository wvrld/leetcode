class Solution {
    class TrieNode {
        var isEnd = false
        var children: [TrieNode?] = Array(repeating: nil, count: 26)

        func insert(_ word: String) {
            var node = self
            for char in word {
                let index = Int(char.asciiValue! - 97)
                if node.children[index] == nil {
                    node.children[index] = TrieNode()
                }
                node = node.children[index]!
            }
            node.isEnd = true
        }
    }

    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        if board.isEmpty || board[0].isEmpty { return [] }
        var result: [String] = []
        var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        let trie = TrieNode()


        func dfs(_ path: String, _ node: TrieNode, _ i: Int, _ j: Int) {
            if node.isEnd {
                result.append(path)
                node.isEnd = false      // to avoid duplicated words
                // return               // don't return here, we should keep on finding, consider ["bend", "benda"]
            }
            
            if i < 0 || i >= board.count || j < 0 || j >= board[0].count { return }
            
            if visited[i][j] { return }

            let char = board[i][j]
            let index = Int(char.asciiValue! - 97)
            if let next = node.children[index] {
                visited[i][j] = true
                let path = "\(path)\(char)"
                dfs(path, next, i - 1, j)
                dfs(path, next, i + 1, j)
                dfs(path, next, i, j - 1)
                dfs(path, next, i, j + 1)
                visited[i][j] = false
            }
        }

        for word in words { trie.insert(word) }

        for i in 0..<board.count {
            for j in 0..<board[i].count {
                dfs("", trie, i, j)
            }
        }
        
        return result
    }

}