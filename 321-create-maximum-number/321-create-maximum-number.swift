class Solution {
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        let start = max(0, k - nums2.count)
        let end = min(k, nums1.count)
        var res = [Int]()

        for i in start...end {
            let stack1 = maxStack(nums: nums1, k: i)
            let stack2 = maxStack(nums: nums2, k: k - i)
            res = compareIntArray(item1: res, item2: mergetStack(stack1: stack1, stack2: stack2))
        }
        
        return res
    }


    func compareIntArray(item1: [Int], item2: [Int]) -> [Int] {
        var i = 0
        var j = 0

        while i < item1.count && j < item2.count {
            if item1[i] < item2[j] {
                return item2
            } else if item1[i] > item2[j] {
                return item1
            }
            i += 1
            j += 1
        }
        
        if i == item1.count { return item2 }
        return item1
    }


    func mergetStack(stack1: [Int], stack2: [Int]) -> [Int] {
        var res = [Int]()
        var i = 0
        var j = 0
        
        let compare = { (index1: Int, index2: Int) -> Bool in
            var index1 = index1
            var index2 = index2

            while index1 < stack1.count && index2 < stack2.count {
                if stack1[index1] < stack2[index2] {
                    return false
                } else if stack1[index1] > stack2[index2] {
                    return true
                }
                index1 += 1
                index2 += 1
            }
            return index1 != stack1.count
        }
        
        while i < stack1.count && j < stack2.count {
            if compare(i, j) { res.append(stack1[i]); i += 1 } 
            else { res.append(stack2[j]); j += 1 }
        }

        while i < stack1.count { res.append(stack1[i]); i += 1 }
        while j < stack2.count { res.append(stack2[j]); j += 1 }
        return res
    }


    func maxStack(nums: [Int], k: Int) -> [Int] {
        var res = Array(repeating: 0, count: k)
        var top = -1
        var remain = nums.count - k

        for i in 0..<nums.count {
            while top >= 0 && res[top] < nums[i] && remain > 0 {
                top -= 1
                remain -= 1
            }
            if top < k - 1 {
                top += 1
                res[top] = nums[i]
            } else {
                remain -= 1
            }
        }

        return res
    }

}