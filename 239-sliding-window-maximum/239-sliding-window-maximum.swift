class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        guard k != 1 else { return nums }
        var ans = [Int]()

        var left = [Int](repeating: 0, count: n)
        left[0] = nums[0]
        var right = [Int](repeating: 0, count: n)
        right[n - 1] = nums[n - 1]

        for i in 1..<n {
            if i % k == 0 {
                left[i] = nums[i]
            } else {
                left[i] = max(left[i-1], nums[i])
            }

            let j = n - i - 1
            if (j + 1) % k == 0 {
                right[j] = nums[j]
            } else {
                right[j] = max(right[j + 1], nums[j])
            }
        }

        for i in 0..<(n - k + 1) {
            ans.append(max(left[i + k - 1], right[i]))
        }

        return ans
    }

}