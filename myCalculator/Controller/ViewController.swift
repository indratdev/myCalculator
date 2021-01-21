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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        // set number pertama
        if secondNumber == "" && operationSymbol == "" {
            print("number 1: di set")
            firstNumber.append(contentsOf: sender.currentTitle!)
            isActive = 1.0
            print("First number : \(firstNumber)")
        }
        
        // set number kedua
        if firstNumber != "" && operationSymbol != ""{
            print("number 2: di set")
            secondNumber.append(contentsOf: sender.currentTitle!)
            isActive = 2.0
            print("Second number : \(secondNumber)")
        }
        
        
    }
    
    
    
    @IBAction func symbolButton(_ sender: UIButton) {
        // reset
        if sender.currentTitle == "AC" {
            resetAC()
        }
        
        // validasi harus isi number pertama
        if firstNumber == "" && sender.currentTitle != "AC" {
            print("please type number first")
        }
        
        // kalo number pertama sudah ke isi, maka symbol bisa di set
        if firstNumber != "" && sender.currentTitle != "=" && sender.currentTitle != "+/-" && sender.currentTitle != "%" {
            operationSymbol = sender.currentTitle!
            print("\(operationSymbol) -> ganti simbol")
        }
        
        //
        if sender.currentTitle == "+/-"{
            switch isActive {
            case 1.0:
                firstNumber = String(Double(firstNumber)! * -1.0)
                print("fistnumber : \(firstNumber)")
            case 2.0:
                secondNumber = String(Double(secondNumber)! * -1.0)
                 print("secondNumber : \(secondNumber)")
            default:
                print("Error when progress plus minus")
            }
        }
        
        if sender.currentTitle == "%" {
            switch isActive {
            case 1.0:
                firstNumber = String(Double(firstNumber)! / 100)
                 print("fistnumber : \(firstNumber)")
            case 2.0:
                secondNumber = String(Double(secondNumber)! / 100)
                 print("secondNumber : \(secondNumber)")
            default:
                print("Error when progress persentase")
            }
        }
        
        // kalo first number, scond nummber dan operation smbol tidak kosong jalankan kalkulasi
        if firstNumber != "" && secondNumber != "" && operationSymbol != "" {
            switch operationSymbol {
            case "+":
                result = Double(firstNumber)! + Double(secondNumber)!
                print("hasilnya adalah \(result)")
                
                firstNumber = String(result)
                secondNumber = ""
                
            case "-":
                result = Double(firstNumber)! - Double(secondNumber)!
                print("hasilnya adalah \(result)")
                
                firstNumber = String(result)
                secondNumber = ""
                
            case "X":
                result = Double(firstNumber)! * Double(secondNumber)!
                print("hasilnya adalah \(result) dari kali X")
                
                firstNumber = String(result)
                secondNumber = ""
                
            case "/" :
                result = Double(firstNumber)! / Double(secondNumber)!
                print("hasilnya adalah \(result) dari pembagaian /")
                
                firstNumber = String(result)
                secondNumber = ""
                
                
            default:
                print("default")
            }
            //            }
        }
        
        
        
    }
    
    func optionSymbol(value: String){
        
    }
    
    func calculateOperation(number1: Double, number2: Double, operan: String){
        
    }
    
    func afterCalculate(){
        
    }
    
}

extension ViewController {
    func clearResult(){
        
    }
    
    func updateUI(text: String){
        
    }
    
    func resetAC(){
        self.firstNumber = ""
        self.secondNumber = ""
        self.operation = false
        self.operationSymbol  = ""
        self.result = 0.0
        print("Reset All Running.....")
    }
    
    func continueCalculate(){
        
    }
    
    func plusMinus(){
        
    }
}
