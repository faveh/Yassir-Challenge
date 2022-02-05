//
//  UIColor+Ext.swift
//  Yassir Challenge
//
//  Created by Ayodimeji Adejuwon on 04/02/2022.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
}
