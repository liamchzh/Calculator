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
