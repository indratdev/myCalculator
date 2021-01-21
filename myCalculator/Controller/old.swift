//
//  old.swift
//  myCalculator
//
//  Created by IndratS on 20/01/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import Foundation

//
//  ViewController.swift
//  myCalculator
//
//  Created by IndratS on 18/01/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

//import UIKit
//
//class ViewController: UIViewController {
//    @IBOutlet weak var resultLabel: UILabel!
//    @IBOutlet weak var numberButton: UIButton!
//
//    var previusNumber: String = ""
//    var secondNumber: String = ""
//    var operation: Bool = false
//    var operationSymbol: String = ""
//    var result: Double = 0.0
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    @IBAction func numberButton(_ sender: UIButton) {
//        if operation {
//            self.secondNumber.append(contentsOf: sender.currentTitle!)
//            updateUI(text: self.secondNumber)
//            //            operation = false
//        }else{
//            self.previusNumber.append(contentsOf: sender.currentTitle!)
//            updateUI(text: self.previusNumber)
//        }
//    }
//
//
//
//    @IBAction func symbolButton(_ sender: UIButton) {
//        // clear semua
//        if sender.currentTitle == "AC" {
//            resetAC()
//
//            // ketika semua kondisi terpenuhi buat di kalkulasi
//        } else if operation && secondNumber != "" && (sender.currentTitle == "=") {
//            calculateOperation(number1: Double(self.previusNumber)!, number2: Double(self.secondNumber)!, operan: self.operationSymbol)
//            print("aku jalan")
//
//            // kalau dia mau ada ganti symbol ketika udah kepilih sebelumnya
//        }else if operation && previusNumber != "" && secondNumber != "" {
//           calculateOperation(number1: Double(self.previusNumber)!, number2: Double(self.secondNumber)!, operan: self.operationSymbol)
//        }else if operation && previusNumber != "" {
//            print("ganti symbol -> operation(true) previusnumber tidak kosong")
//            self.operationSymbol = sender.currentTitle!
//        }else if !operation {
//            operation = true
//            optionSymbol(value: sender.currentTitle!)
//            print("\(sender.currentTitle!) dipilih")
//        }
//    }
//
//    func optionSymbol(value: String){
//        switch value {
//        case "+":
//            print("plus")
//            operationSymbol = "+"
//        case "-":
//            operationSymbol = "-"
//        case "X":
//            operationSymbol = "*"
//        case "/":
//            operationSymbol = "/"
//        case "AC":
//            print("AC")
//        case "+/-":
//            print("plus minus")
//        default:
//            print("default")
//        }
//    }
//
//    func calculateOperation(number1: Double, number2: Double, operan: String){
//        switch operan {
//        case "+":
//            self.result = number1 + number2
//            afterCalculate()
//        case "-":
//            self.result = number1 - number2
//            afterCalculate()
//        case "*":
//            self.result = number1 * number2
//            afterCalculate()
//        case "/":
//            self.result = number1 / number2
//            afterCalculate()
//        default:
//            print("default")
//        }
//    }
//
//    func afterCalculate(){
//        updateUI(text: String(result))
//        continueCalculate()
//        self.previusNumber = String(result)
//    }
//
//}
//
//extension ViewController {
//    func clearResult(){
//        resultLabel.text = ""
//    }
//
//    func updateUI(text: String){
//        resultLabel.text = text
//    }
//
//    func resetAC(){
//        self.previusNumber = ""
//        self.secondNumber = ""
//        operation = false
//        operationSymbol = ""
//        resultLabel.text = ""
//    }
//
//    func continueCalculate(){
//        previusNumber = ""
//        secondNumber = ""
//        operation = false
//        operationSymbol = ""
//    }
//
//    func plusMinus(){
//        //        let data: Double = Double(self.previusNumber)!
//        //        self.previusNumber = String((data * -1))
//    }
//}
