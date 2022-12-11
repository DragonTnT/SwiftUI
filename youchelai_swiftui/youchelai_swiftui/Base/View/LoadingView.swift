//
//  LoadingView.swift
//  youchelai_swiftui
//
//  Created by longfan on 2022/11/28.
//

import SwiftUI

struct LoadingView: View {
    @State private var degrees: Double = 0
    
    var body: some View {
        ZStack {
            Color.white
            Image("loading_color")
                .rotationEffect(Angle(degrees: degrees))
                .onAppear {
                    withAnimation(Animation
                        .linear(duration: 1)
                        .speed(2)
                        .repeatForever(autoreverses: false)) {
                        degrees = 360
                    }
                }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
