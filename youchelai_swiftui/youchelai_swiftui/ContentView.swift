//
//  ContentView.swift
//  youchelai_swiftui
//
//  Created by Allen long on 2022/11/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationView(title: "选择服务")
            // TODO: 如何添加leftView?
            TextField("", text: $username)
                .frame(height: adapter(38))
                .font(.rFont(14))
                .placeholder(when: username.isEmpty, text: "搜索服务名称", font: .rFont(14))
                .foregroundColor(Color(Color_1F2129))
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
