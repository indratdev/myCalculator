//
//  CalculatorModel.swift
//  myCalculator
//
//  Created by IndratS on 22/01/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorModel {
    lazy var vc = ViewController()
    
    func plusMinus(number: String) -> String {
        let sNumber = Double(number)! * -1.0
        return String(sNumber)
    }
    
    mutating func persentase(isActive: Double, firstNumber: String, secondNumber: String) -> String {
        var result: String = ""
        switch isActive {
        case 1.0:
            result = String(Double(firstNumber)! / 100)
            vc.firstNumber = result
        case 2.0:
            result = String(Double(secondNumber)! / 100)
            vc.secondNumber = result
        default:
            print("Error when progress persentase")
        }
        return result
    }
    
}
