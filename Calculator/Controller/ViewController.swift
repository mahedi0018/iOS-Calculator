//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNum : Bool = true
    
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can't convert dispaly label to Double.")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculatorLogic  = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNum = true
        
        calculatorLogic.setNumber(displayValue)
        if let calMethod = sender.currentTitle{
            if let result = calculatorLogic.calculate(symbol: calMethod){
                displayValue = result
            }
            
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNum == true {
                displayLabel.text = numValue
                isFinishedTypingNum = false
            }else{
                if numValue == "." {
                    guard let currentValue = Double(displayLabel.text!) else {
                        fatalError("Can't convert dispaly label to Double.")
                    }
                    let isInt = floor(currentValue) == currentValue
                    if !isInt {
                        return
                    }
                    //                    displayLabel.text = displayLabel.text! + numValue
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
        
        
    }
    
}

