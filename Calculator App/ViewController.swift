//
//  ViewController.swift
//  Calculator App
//
//  Created by Ana on 11/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var firstNum: String = ""
    
    var operation: String = ""
    
    var secondNum: String = ""
    
    var haveResult: Bool = false
    
    var resultNumber: String = ""
    
    var numAfterResult: String = ""
    
    
    
    @IBAction func add(_ sender: Any) {
        operation = "+"
    }
    
    
    @IBAction func subtract(_ sender: Any) {
        operation = "-"
    }
    
    @IBAction func multiply(_ sender: Any) {
        operation = "X"
    }
    
    
    @IBAction func divide(_ sender: Any) {
        operation = "/"
    }
    
    
    @IBAction func equals(_ sender: Any) {
        if let result = doOperation() {
            numOnScreen.text = String(result)
            haveResult = true
            resultNumber = String(result)
        }
        
    }
    
    
    
    @IBOutlet weak var numOnScreen: UILabel!
    
    @IBOutlet var calcButtons: [UIButton]!
    
    @IBAction func numPressed(_ sender: UIButton) {
        if operation == "" {
            firstNum += String(sender.tag)
            numOnScreen.text = firstNum;
        }
        
        else if operation != "" && !haveResult {
            secondNum += String(sender.tag)
            numOnScreen.text = secondNum;
        }
        else if operation != "" && haveResult {
            numAfterResult += String(sender.tag)
            numOnScreen.text = numAfterResult
        }
    }
    
    
    @IBAction func clear(_ sender: Any) {
        firstNum = ""
        
        operation = ""
        
        secondNum = ""
        
        haveResult = false
        
        resultNumber = ""
        
        numAfterResult = ""
        
        numOnScreen.text = "0"
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calcButtons {
            button.layer.cornerRadius = button.frame.size.height / 2
            button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        }
        
        
    }
    
    func doOperation() -> String? {
        guard let userInputFirst = Double(firstNum), let userInputSecond = Double(secondNum) else {
            return nil
        }
        
        var result: Double = 0.0
        
        switch operation {
        case "+":
            result = userInputFirst + userInputSecond
        case "-":
            result = userInputFirst - userInputSecond
        case "X":
            result = userInputFirst * userInputSecond
        case "/":
            if userInputSecond != 0 {
                result = userInputFirst / userInputSecond
            } else {
                
                return nil
            }
        default:
            return nil
        }
        
        
        return String(format: "%g", result)
    }
}
