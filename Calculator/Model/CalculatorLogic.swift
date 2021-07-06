import UIKit

struct CalculatorLogic {
    private var number : Double?
    
    private var intermediateCalculation : (n1: Double, calMethod: String)?
 
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
               return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
               return performTwoNumCal(n2: n)
            default:
                intermediateCalculation = (n1: n, calMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCal(n2: Double)->Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calMethod {
            switch operation {
            case "+":
               return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "×":
               return n1 * n2
            default:
                print("Something wrong")
            }
        }
        
        return nil
    }
}
