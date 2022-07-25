class Solution {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var res = [String]()
        helper(&res, "", Array(num), target, 0, 0, 0)
        return res
    }
    
    
    private func helper(_ res: inout [String], _ str: String, _ numChars: [Character], _ target: Int, _ pos: Int, _ currentAccum: Int, _ prevNum: Int) {
        if pos == numChars.count {
            if currentAccum == target { res.append(str) }; return 
        }
        
        for i in pos ..< numChars.count {
            if i != pos && numChars[pos] == "0" { break }
            
            let current = Int(String(numChars[pos ..< i+1]))!
            
            if pos == 0 {
                helper(&res, str + String(current), numChars, target, i + 1, current, current)
            } else {
                helper(&res, str + "+" + String(current), numChars, target, i + 1, currentAccum + current, current)
                helper(&res, str + "-" + String(current), numChars, target, i + 1, currentAccum - current, -current)
                helper(&res, str + "*" + String(current), numChars, target, i + 1, currentAccum - prevNum + prevNum * current, prevNum * current)
            }
        }
    }

}