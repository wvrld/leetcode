class Solution {
func candy(_ ratings: [Int]) -> Int {
		var indexs: [Int] = []
		var count = 0
        
        for i in 0..<ratings.count {
			let left = i > 0 ? ratings[i - 1] : Int.max
			let right = i < ratings.count - 1 ? ratings[i + 1] : Int.max
			
            if ratings[i] <= left && ratings[i] <= right {
				indexs.append(i)
				count += 1
			}
		}
		
        indexs.append(ratings.count)
		
        var prev = -1
        for index in indexs {
			let start = prev + 1
			let end = index
			
            if end > start {
				var maxRating = Int.min
				var maxIndex = Int.min
				
                for i in start..<end {
					if ratings[i] >= maxRating {
						maxRating = ratings[i]
						maxIndex = i
					}
				}
				
                var leftCount = maxIndex - start
				var rightCount = end - maxIndex - 1
				
                if maxIndex - 1 >= start && ratings[maxIndex - 1] == maxRating { //	two max
					rightCount += 1
				
                } else {
					if leftCount > rightCount {
						leftCount += 1
					
                    } else {
						rightCount += 1
					}
				}
                
				count += (2 + leftCount + 1) * leftCount / 2 + (2 + rightCount + 1) * rightCount / 2
			}
			
            prev = index
		}
        
		return count
    }
    
}