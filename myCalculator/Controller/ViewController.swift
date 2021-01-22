//
//  ViewController.swift
//  myCalculator
//
//  Created by IndratS on 18/01/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberButton: UIButton!
    
    var firstNumber: String = ""
    var secondNumber: String = ""
    var operation: Bool = false
    var operationSymbol: String = ""
    var result: Double = 0.0
    var isActive: Double = 0.0
    
    var cm = CalculatorModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAC()
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        // set number pertama
        if secondNumber == "" && operationSymbol == "" {
            firstNumber.append(contentsOf: sender.currentTitle!)
            up(number: 1, isActive: 1.0, label: self.firstNumber)
        }
        // set number kedua
        if firstNumber != "" && operationSymbol != ""{
            secondNumber.append(contentsOf: sender.currentTitle!)
            up(number: 2, isActive: 2.0, label: self.secondNumber)
        }
    }
    
    @IBAction func symbolButton(_ sender: UIButton) {
        // reset
        if sender.currentTitle == "AC" {
            resetAC()
        }
        // validasi harus isi number pertama
        if firstNumber == "" && sender.currentTitle != "AC" {
            return
        }
        //
        if sender.currentTitle == "+/-" {
            switch isActive {
            case 1.0:
                firstNumber = cm.plusMinus(number: firstNumber)
                updateResultLabel(text: firstNumber)
            case 2.0:
                secondNumber = cm.plusMinus(number: secondNumber)
                updateResultLabel(text: secondNumber)
            default:
                print("Error when progress plus minus")
            }
        }
        
        if sender.currentTitle == "%" {
            let persen = cm.persentase(isActive: isActive, firstNumber: firstNumber, secondNumber: secondNumber)
            updateResultLabel(text: persen)
        }
        // kalo first number, scond nummber dan operation smbol tidak kosong jalankan kalkulasi
        if firstNumber != "" && secondNumber != "" && operationSymbol != "" {
            let result = checkCalculation(symbol: operationSymbol)
            calculation(result: result, resultLabel: result)
        }
        
        // kalo number pertama sudah ke isi, maka symbol bisa di set
        if firstNumber != "" && sender.currentTitle != "=" && sender.currentTitle != "+/-" && sender.currentTitle != "%" {
            operationSymbol = sender.currentTitle!
            sender.isHighlighted = true
            print("\(operationSymbol) -> ganti simbol")
        }
    }
}

extension ViewController {
    func updateResultLabel(text: String){
        resultLabel.text = text
    }
    
    func resetAC(){
        self.firstNumber = ""
        self.secondNumber = ""
        self.operation = false
        self.operationSymbol  = ""
        self.result = 0.0
        resultLabel.text = "0.0"
        print("Reset All Running.....")
        
    }
    
    func up(number: Int, isActive: Double, label: String){
        switch number {
        case 1:
            self.isActive = isActive
            self.resultLabel.text = label
        case 2:
            self.isActive = isActive
            self.resultLabel.text = label
        default:
            print("")
        }
    }
    
    func checkCalculation(symbol: String) -> Double {
        switch symbol {
        case "+":
            return (Double(firstNumber)! + Double(secondNumber)!)
        case "-":
            return (Double(firstNumber)! - Double(secondNumber)!)
        case "X":
            return (Double(firstNumber)! * Double(secondNumber)!)
        case "/" :
            return (Double(firstNumber)! / Double(secondNumber)!)
        default:
            return 0.0
        }
    }
    
    func calculation(result: Double, resultLabel: Double){
        updateResultLabel(text: String(resultLabel))
        self.firstNumber = String(result)
        self.secondNumber = ""
    }
    
}
