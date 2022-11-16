//
//  View+Extension.swift
//  youchelai_swiftui
//
//  Created by Allen long on 2022/11/10.
//

import Foundation
import SwiftUI

//extension View {
//    func rFont(_ fontSize: CGFloat, withAdapter: Bool = true) -> some View {
//        let size = withAdapter ? adapter(fontSize) : fontSize
//        let font = Font.custom("DINOT-Regular", size: size)
//        return self.font(font)
//    }
//    func mFont(_ fontSize: CGFloat, withAdapter: Bool = true) -> some View {
//        let size = withAdapter ? adapter(fontSize) : fontSize
//        let font = Font.custom("DINOT-Medium", size: size)
//        return self.font(font)
//    }
//}

extension Font {
    static func rFont(_ fontSize: CGFloat, withAdapter: Bool = true) -> Font {
        let size = withAdapter ? adapter(fontSize) : fontSize
        let font = Font.custom("DINOT-Regular", size: size)
        return font
    }
    
    static func mFont(_ fontSize: CGFloat, withAdapter: Bool = true) -> Font {
        let size = withAdapter ? adapter(fontSize) : fontSize
        let font = Font.custom("DINOT-Regular", size: size)
        return font
    }
}

extension View {
    func placeholder(when shouldShow: Bool, text: String, font: Font, color: Color = Color(Color_F2F6F8)) -> some View {
        ZStack(alignment: .leading) {
            Text(text)
                .font(font)
                .foregroundColor(color)
                .opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
