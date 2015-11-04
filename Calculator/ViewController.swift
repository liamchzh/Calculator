//
//  ViewController.swift
//  Calculator
//
//  Created by CHENZHENG on 11/2/15.
//  Copyright © 2015 CHENZHENG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false

    @IBAction func appendDitgit(sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + number
        } else {
            display.text = number
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            userIsInTheMiddleOfTypingANumber = false
            operaStack.append(displayValue)
        }
        
        switch operation {
            case "×": performOperation {$0 * $1}
            case "÷": performOperation {$1 / $0}
            case "-": performOperation {$1 - $0}
            case "+": performOperation {$0 + $1}
            default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operaStack.count >= 2 {
            displayValue = operation(operaStack.removeLast(), operaStack.removeLast())
        }
    }
    
//    func multiply(op1: Double, op2: Double) -> Double {
//        print("multiply")
//        return op1 * op2;
//    }
    
    var operaStack = Array<Double>()
    
    @IBAction func enter(sender: UIButton) {
        userIsInTheMiddleOfTypingANumber = false
        operaStack.append(displayValue)
        print("operaStack is \(operaStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}
