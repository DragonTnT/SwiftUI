//
//  Const.swift
//  youchelai_swiftui
//
//  Created by Allen long on 2022/11/10.
//

import Foundation
import UIKit

public let kScreenH = UIScreen.main.bounds.size.height
public let kScreenW = UIScreen.main.bounds.size.width
public let statusBarH = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

public let Color_1F2129 = hexColor("1F2129")
public let Color_F2F6F8 = hexColor("F2F6F8")
public let Color_9096AB = hexColor("9096AB")

/// frame适配器
func adapter(_ value: CGFloat) -> CGFloat {
    if value < 1 {
        return (value * (UIScreen.main.bounds.width/375))
    } else {
        return (value * (UIScreen.main.bounds.width/375)).rounded()
    }
}

/// 消除默认的adapter适配
func noAdapter(_ value: CGFloat) -> CGFloat {
    return value / (UIScreen.main.bounds.width/375)
}


func hexColor(_ hex:String, alpha: CGFloat = 1.0) -> UIColor {
    
    var cString:String = hex.trimmingCharacters(in: (NSCharacterSet.whitespacesAndNewlines as NSCharacterSet) as CharacterSet).uppercased()
    
    if (cString.hasPrefix("#")) {
        let index = cString.index(cString.startIndex, offsetBy: 1)
        cString = String(cString[index...])
    }
    
    if (cString.count != 6) {
        return .gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
}
