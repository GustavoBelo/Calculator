//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Gustavo Belo on 10/07/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import UIKit

struct CalculatorLogic {
    private(set) var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func caculate (symbol: String) -> Double? {
        if let n = number{
            switch symbol {
            case "+/-" :
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(n2: n)
            default: intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation{
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default: fatalError("The operation passed does not match any of the cases")
            }
        }
        return nil
    }
}
