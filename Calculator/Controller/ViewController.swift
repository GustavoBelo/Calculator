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
        
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number  = Double(displayLabel.text!) else { fatalError("Cannot covert display text to a Double") }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let results = calculator.caculate(symbol: calcMethod) {
                displayValue = results
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt { return }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

