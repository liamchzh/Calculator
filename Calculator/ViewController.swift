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
    
    var begin: Bool = true

    @IBAction func appendDitgit(sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if begin {
            display.text = number
            begin = false
        } else {
            display.text = display.text! + number
        }
    }
}
