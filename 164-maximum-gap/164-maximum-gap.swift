class Solution {
    func maximumGap(_ nums: [Int]) -> Int {
        let count = nums.count
        guard count >= 2 else { return 0 }
        
        var minNum = nums[0], maxNum = nums[0]
        for n in nums {
            minNum = min(minNum, n)
            maxNum = max(maxNum, n)
        }
        
        let stride = max(1, (maxNum - minNum) / (count - 1))
        var buckets = Array(repeating: [-1, -1], count: (maxNum - minNum) / stride + 1)
        
        for n in nums {
            let i = (n - minNum) / stride
            if buckets[i][0] == -1 {
                buckets[i][0] = n
                buckets[i][1] = n
            } else {
                buckets[i][0] = min(buckets[i][0], n)
                buckets[i][1] = max(buckets[i][1], n)
            }
        }
        
        var gap = 0, prev = -1
        for i in 0..<buckets.count {
            if buckets[i][0] == -1 { continue }
            if prev != -1 {
                gap = max(gap, buckets[i][0] - buckets[prev][1])
            }
            prev = i
        }
        
        return gap
    }
    
}