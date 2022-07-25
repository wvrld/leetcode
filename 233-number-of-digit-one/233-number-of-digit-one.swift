class Solution {
    func countDigitOne(_ n: Int) -> Int {
        let digits = digit(n)
        var sum = 0
        
        for (i, digit) in digits.enumerated() {
            let base = Int(pow(10.0, Double(digits.count - i - 1)))
            let high = n / (base * 10)
            sum += high * base      
            if digit > 1 {
                sum += base         
            } else if digit == 1 {
                sum += n % base + 1
            }
        }
        return sum
    }
    
    
    func digit(_ n: Int) -> [Int] {
        var res: [Int] = []
        var num = n
        var rem = 0
        
        while num > 0 {
            rem = num % 10
            num = num / 10
            res.append(rem)
        }
        
        return res.reversed()
    }
    
}