class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        guard !prices.isEmpty, k > 0 else { return 0 }

        let count = prices.count
        guard k < count / 2 else { return maxProfit(prices) }

        var ans = [[Int]](repeating: [Int](repeating: 0, count: count), count: k+1)

        for i in 1...k {
            var tmpMax = -prices[0]
            for j in 1..<count {
                ans[i][j] = max(ans[i][j-1], prices[j] + tmpMax)
                tmpMax = max(tmpMax, ans[i-1][j-1] - prices[j])
            }
        }

        return ans[k][count-1]
    }


    private func maxProfit(_ prices: [Int]) -> Int {
        var ans = 0

        for i in 1..<prices.count {
            guard prices[i] > prices[i-1] else { continue }
            ans += prices[i] - prices[i-1]
        }

        return ans
    }

}