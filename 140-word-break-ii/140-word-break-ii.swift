class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var dict = [String: [String]]()
        return dfs(s, wordDict, &dict)
    }


    private func dfs(_ s: String, _ wordDict: [String], _ dict: inout [String: [String]]) -> [String] {
        if let val = dict[s] { return val }
        guard !s.isEmpty else { return [""] }
        var ans = [String]()

        for word in wordDict {
            guard s.hasPrefix(word) else { continue }
            let sublist = dfs(String(s.dropFirst(word.count)), wordDict, &dict)
            for sub in sublist {
                ans.append("\(word)\(sub.isEmpty ? "" : " ")\(sub)")
            }
        }

        dict[s] = ans
        return ans
    }

}