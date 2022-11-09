//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Sourav Singh Rawat on 08/11/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var n1: String?
    var n2: String?
    var operation: String?
    
    private var _n1: Double {
        get {
            guard let value = Double(n1!) else {
                fatalError("Failed to convert n1 to Double")
            }
            
            return value
        }
    }
    
    private var _n2: Double {
        get {
            guard let value = Double(n2!) else {
                fatalError("Failed to convert n2 to Double")
            }
            
            return value
        }
    }
    
    private var plus: Double {
        get {
            return _n1 + _n2
        }
    }
    
    private var substract: Double {
        get {
            return _n1 - _n2
        }
    }
    
    private var multiply: Double {
        get {
            return _n1 * _n2
        }
    }
    
    private var devide: Double {
        get {
            return _n1/_n2
        }
    }
    
    private var percentage: Double {
        get {
            return (_n1*_n2)/100
        }
    }
    
    func calculate() -> Double?{
        if(n1 == nil || n2 == nil || operation == nil){
            return nil
        }
        
        switch operation {
        case "+":
            return plus
        case "-":
            return substract
        case "×":
            return multiply
        case "÷":
            return devide
        case "%":
            return percentage
        default:
            fatalError("Failed, operation not recoganized")
        }
    }
}
