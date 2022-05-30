//
//  ViewController.swift
//
//  Created by Георгий on 15.04.2022.
//

import UIKit

class ViewController: UIViewController {
    var operation : MathOpetion? = nil
    var pastOperation : MathOpetion? = nil
    var result : Int = 0
    var newValue : Int = 0
    
    @IBAction func onZero(_ sender: Any) {
        addDigit("0")
    }
    @IBAction func onOne(_ sender: Any) {
        addDigit("1")
    }
    @IBAction func onTwo(_ sender: Any) {
        addDigit("2")
    }
    @IBAction func onThree(_ sender: Any) {
        addDigit("3")
    }
    @IBAction func onFour(_ sender: Any) {
        addDigit("4")
    }
    @IBAction func onFive(_ sender: Any) {
        addDigit("5")
    }
    @IBAction func onSix(_ sender: Any) {
        addDigit("6")
    }
    @IBAction func onSeven(_ sender: Any) {
        addDigit("7")
    }
    @IBAction func onEight(_ sender: Any) {
        addDigit("8")
    }
    @IBAction func onNine(_ sender: Any) {
        addDigit("9")
    }
    
    @IBOutlet weak var resultNumber: UILabel!
    
    @IBAction func onSubstract(_ sender: Any) {
        operation = .substract
        pastOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @IBAction func onIncrease(_ sender: Any) {
        operation = .increase
        pastOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @IBAction func onDivide(_ sender: Any) {
        operation = .divide
        pastOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @IBAction func onReset(_ sender: Any) {
         operation  = nil
         pastOperation = nil
         result = 0
         newValue  = 0
        isNewValue = true
        resultNumber.text = "0"
    }
    @IBAction func onEqual(_ sender: Any) {
        calculate()
    }
    @IBAction func onPlus(_ sender: Any) {
        operation = .sum
        pastOperation = nil
        isNewValue = true
        result = getInteger()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resultNumber.text = Text.clacText
    }
    var isNewValue = true
    
    func addDigit(_ digit : String){
        if isNewValue{
            resultNumber.text = ""
            isNewValue = false
        }
        var digits = resultNumber.text
        digits?.append(digit)
        resultNumber.text = digits
    }
    func getInteger() -> Int {
        return Int(resultNumber.text ?? "0") ?? 0
    }
    func calculate() {
        guard let operation = operation else {
            return
        }
        if pastOperation != operation {
            newValue = getInteger()
        }
        result = operation.makeMath(result: result, newValue: newValue)
        
        pastOperation = operation
        resultNumber.text = "\(result)"
        isNewValue = true
    }
    
}

enum MathOpetion {
    case sum, substract, increase , divide
    
    func makeMath(result: Int ,newValue:Int ) -> Int {
        switch self {
        case .sum:
            return result + newValue
        case .substract:
           return result - newValue
        case .increase:
            return result * newValue
        case .divide:
            return result/newValue
        }
    }
}
