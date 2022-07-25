class Solution {
    func shortestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var string: [Character] = ["#"]
        
        for c in chars {
            string.append(c)
            string.append("#")
        }
        
        var maxIndex = 0
        var dp: [Int] = Array(repeating: 0, count: string.count)
        var r = 0
        var c = 0
        
        for i in 0..<string.count {
            let mirror = 2 * c - i
            if i < r { dp[i] = min(r - i, dp[mirror]) }
            var a = i + (1 + dp[i])
            var b = i - (1 + dp[i])
            while a < string.count && b >= 0 && string[a] == string[b] {
                dp[i] += 1
                a += 1
                b -= 1
            }
            if i + dp[i] > r {
                c = i
                r = i + dp[i]
            }
            if i == dp[i] {
                maxIndex = i
            }
        }

        return String(Array(chars[maxIndex..<chars.count].reversed()) + chars)
    }
    
}