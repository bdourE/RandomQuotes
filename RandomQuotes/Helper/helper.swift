//
//  File.swift
//  RandomQuotes
//
//  Created by بدور on 13/07/2020.
//  Copyright © 2020 Bdour. All rights reserved.
//

import Foundation
import UIKit

//Generate Random number
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

//Generate Random color
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}
