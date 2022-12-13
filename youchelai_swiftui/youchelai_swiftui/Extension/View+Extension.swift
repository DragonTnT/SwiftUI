//
//  View+Extension.swift
//  youchelai_swiftui
//
//  Created by Allen long on 2022/11/10.
//

import Foundation
import SwiftUI
import AlertToast

extension Font {
    static func rFont(_ fontSize: CGFloat, withAdapter: Bool = true) -> Font {
        let size = withAdapter ? adapter(fontSize) : fontSize
        let font = Font.custom("DINOT-Regular", size: size)
        return font
    }
    
    static func mFont(_ fontSize: CGFloat, withAdapter: Bool = true) -> Font {
        let size = withAdapter ? adapter(fontSize) : fontSize
        let font = Font.custom("DINOT-Medium", size: size)
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
    
    func noSeparator() -> some View {
        if #available(iOS 15.0, *) {
            return self.listRowSeparator(.hidden)
        } else {
                return self
        }
    }
    
    func listBackgroundColor(color: Color) -> some View {
        if #available(iOS 16.0, *) {
            return self
                .background(color)
                .scrollContentBackground(.hidden)
        } else {
            return self
        }
    }
}

// MARK: - AlertToast
extension View {

    @ViewBuilder
    func toast(_ text: String?, isPresenting: Binding<Bool>) -> some View {
        if let text = text, !text.isEmpty {
            self.toast(isPresenting: isPresenting) {
                let style: AlertToast.AlertStyle = .style(backgroundColor: Color(Color_1F2129.withAlphaComponent(0.7)),
                                                          titleColor: Color.white)
                return AlertToast(type: .regular, title: text, style: style)
            }
        } else {
            self
        }
    }
}

