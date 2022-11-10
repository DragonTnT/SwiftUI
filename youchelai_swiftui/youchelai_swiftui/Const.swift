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

public let Color_1F2129 = UIColor.black
public let Color_F2F6F8 = UIColor.gray

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
