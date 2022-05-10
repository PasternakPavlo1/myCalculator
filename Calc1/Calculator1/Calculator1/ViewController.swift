//
//  ViewController.swift
//  Calculator1
//
//  Created by Павло Пастернак on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var numberOnScreen : Double = 0.0
    var firstNumber : Double = 0.0
    var operation = 0
    var calculating = false
    var haveDeci = false
    var isFirstInput = true
    var haveOperations = false
    
    // MARK: - Outlet
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Actions
    @IBAction func number(_ sender: Any) {
        let decimal = CharacterSet(charactersIn: ".")
        if resultLabel.text?.rangeOfCharacter(from: decimal) != nil {
            haveDeci = true
        } else {
            haveDeci = false
        }
        
        if((sender as! UIButton).tag == 17 ) {
            if(!haveDeci) {
                resultLabel.text = resultLabel.text! + String(".")
                haveDeci = true
                isFirstInput = false
            } else {
                print("already have a decimal")
            }
            
        } else {
            if(calculating) {
                resultLabel.text = String((sender as! UIButton).tag-1)
                numberOnScreen = Double(resultLabel.text!)!
                calculating = false
                isFirstInput = false
                haveOperations = false
            } else {
                resultLabel.text = resultLabel.text! + String((sender as! UIButton).tag-1)
                numberOnScreen = Double(resultLabel.text!)!
                isFirstInput = false
                haveOperations = false
            }
        }
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if(!isFirstInput && haveOperations==false) {
            firstNumber = Double(resultLabel.text!)!
            
            if (sender.tag == 12) {
                resultLabel.text = "%"
            } else if (sender.tag == 13) {
                resultLabel.text = "/"
            } else if (sender.tag == 14) {
                resultLabel.text = "×"
            } else if (sender.tag == 16) {
                resultLabel.text = "+"
            }
            
            haveOperations = true
            operation = sender.tag
            isFirstInput = false
            calculating = true
            
        } else if(sender.tag == 15) {
            resultLabel.text = "-"
            haveOperations = true
        }
    }
    
    @IBAction func execute(_ sender: UIButton) {
        if(operation == 11) {
            resultLabel.text = String()
        } else if (operation == 12) {
            resultLabel.text = String(firstNumber / 100 * numberOnScreen)
        } else if (operation == 13) {
            resultLabel.text = String(firstNumber / numberOnScreen)
        } else if (operation == 14) {
            resultLabel.text = String(firstNumber * numberOnScreen)
        } else if (operation == 15) {
            resultLabel.text = String(firstNumber - numberOnScreen)
        } else if (operation == 16) {
            resultLabel.text = String(firstNumber + numberOnScreen)
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        resultLabel.text = ""
        operation = 0
        haveDeci = false
        isFirstInput = true
        haveOperations = false
    }
}

