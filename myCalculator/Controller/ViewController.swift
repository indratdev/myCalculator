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
        if sender.currentTitle == "+/-"{
            switch isActive {
            case 1.0:
                firstNumber = String(Double(firstNumber)! * -1.0)
            //                print("fistnumber : \(firstNumber)")
            case 2.0:
                secondNumber = String(Double(secondNumber)! * -1.0)
            //                print("secondNumber : \(secondNumber)")
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
                //                print("hasilnya adalah \(result)")
//                updateResultLabel(text: String(result))
//
//                firstNumber = String(result)
//                secondNumber = ""
                calculation(result: result, resultLabel: String(result))
                
            case "-":
                result = Double(firstNumber)! - Double(secondNumber)!
                //                print("hasilnya adalah \(result)")
//                updateResultLabel(text: String(result))
//
//                firstNumber = String(result)
//                secondNumber = ""
//                calculation(result: result, resultLabel: String(result))
                calculation(result: result, resultLabel: String(result))
                
            case "X":
                result = Double(firstNumber)! * Double(secondNumber)!
                //                print("hasilnya adalah \(result) dari kali X")
//                updateResultLabel(text: String(result))
//
//                firstNumber = String(result)
//                secondNumber = ""
                calculation(result: result, resultLabel: String(result))
                
            case "/" :
                result = Double(firstNumber)! / Double(secondNumber)!
                //                print("hasilnya adalah \(result) dari pembagaian /")
//                updateResultLabel(text: String(result))
//
//                firstNumber = String(result)
//                secondNumber = ""
                calculation(result: result, resultLabel: String(result))
                
                
            default:
                print("default")
            }
            //            }
        }
        
        // kalo number pertama sudah ke isi, maka symbol bisa di set
        if firstNumber != "" && sender.currentTitle != "=" && sender.currentTitle != "+/-" && sender.currentTitle != "%" {
            operationSymbol = sender.currentTitle!
            //            sender.currentTitle
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
    
    func calculation(result: Double, resultLabel: String){
        updateResultLabel(text: resultLabel)
        self.firstNumber = String(result)
        self.secondNumber = ""
    }
    
}
