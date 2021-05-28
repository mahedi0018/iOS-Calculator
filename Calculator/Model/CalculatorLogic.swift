import UIKit

struct CalculatorLogic {
    var number : Double
    init(number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        switch symbol {
        case "AC":
            number = 0
           return number 
        case "+/-":
            number = -number
            return number
        case "%":
            number = number * 0.01
            return number
        default:
            print("Default")
        }
        
        
        return nil
    }
}
