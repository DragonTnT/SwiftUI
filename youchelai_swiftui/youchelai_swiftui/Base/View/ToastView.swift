//
//  ToastView.swift
//  youchelai_swiftui
//
//  Created by longfan on 2022/12/11.
//

import SwiftUI

struct ToastView: View {
    
    let content: String
    
    init(_ content: String) {
        self.content = content
    }    
    
    var body: some View {
        Text(content)
            .font(Font.rFont(16))
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView("this is a toast")
    }
}
