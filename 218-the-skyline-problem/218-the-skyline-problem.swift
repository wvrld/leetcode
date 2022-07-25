class Solution {
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        var points: [Int] = []
        var pos = 0
        var result: [[Int]] = []
        var currHeight = 0
        
        for building in buildings {
            points.append(building[0])
            points.append(building[1])
        }
        points.sort()
        
        var segs = [Int](repeating: 0, count: points.count)
        
        for building in buildings {
            // find start point
            while points[pos] < building[0] { pos += 1 }
            // go to end
            var i = pos
            
            while points[i] < building[1] {
                if segs[i] < building[2] {
                    segs[i] = building[2]
                }
                i += 1
            }
        }
        
        for (index, h) in segs.enumerated() {
            if currHeight != h {
                result.append([points[index], h])
                currHeight = h
            }
        }
        
        return result
    }
    
}