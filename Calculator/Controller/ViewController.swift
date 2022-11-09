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
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        if let operation = sender.currentTitle {
            switch operation {
            case "=":
                onCalculatePressed()
            case "+/-":
                onToggleValueSign()
            case "AC":
                clearAll()
            default:
                calculatorBrain.operation = operation
                displayLabel.text = "0"
            }
        }
        
    }

    var isFillingN2: Bool {
        return calculatorBrain.n1 != nil && calculatorBrain.operation != nil
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if displayLabel.text == "0" {
            displayLabel.text = ""
        }
        
        let currentText = sender.currentTitle!
        
        if currentText == "." {
            guard let displayNumber = Double(displayLabel.text!) else {
                return
            }
            
            if(floor(displayNumber) != displayNumber){
                return
            }
        }
        
        
        let value = "\(displayLabel.text ?? "")\(currentText)"
        
        if (isFillingN2){
            calculatorBrain.n2 = value
        }else{
            calculatorBrain.n1 = value
        }
        
        displayLabel.text = value
    
    }
    
    func clearAll(){
        displayLabel.text = "0"
        calculatorBrain.n1 = nil
        calculatorBrain.n2 = nil
        calculatorBrain.operation = nil
    }
    
    func onToggleValueSign() {
        let value = toggleSign(displayLabel.text!)
        
        if(isFillingN2){
            calculatorBrain.n2 = value
        }else{
            calculatorBrain.n1 = value
        }
        
        displayLabel.text = value
    }
    
    func toggleSign(_ value: String) -> String {
        guard let _value = Double(value) else {
            fatalError("Failed to understand toggle value")
        }
        
        if _value == 0 {
            return "0"
        }
        
        return String(_value * -1)
    }
    
    func onCalculatePressed(){
        if let ans = calculatorBrain.calculate() {
            displayLabel.text = String(format: "%.6f", ans)
        }
    }

}

