//
//  UIColor+Ext.swift
//  FoodPin
//
//  Created by 黃士豪 on 2021/7/2.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    convenience init(red: Int,green: Int,blue:Int){
        let redVlue = CGFloat(red)/255.0
        let greenValue = CGFloat(green)/255.0
        let blueValue = CGFloat(blue)/255.0
        self.init(red:redVlue,green:greenValue,blue:blueValue,alpha:1.0)
    }
}
