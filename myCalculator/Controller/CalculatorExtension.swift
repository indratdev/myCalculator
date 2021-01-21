//
//  CalculatorExtension.swift
//  myCalculator
//
//  Created by IndratS on 21/01/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import Foundation
import UIKit

    extension UIButton{
        func roundedButton(){
            let maskPath1 = UIBezierPath(roundedRect: bounds,
                byRoundingCorners: [.topLeft , .topRight],
                cornerRadii: CGSize(width: 8, height: 8))
            let maskLayer1 = CAShapeLayer()
            maskLayer1.frame = bounds
            maskLayer1.path = maskPath1.cgPath
            layer.mask = maskLayer1
        }
    
}
