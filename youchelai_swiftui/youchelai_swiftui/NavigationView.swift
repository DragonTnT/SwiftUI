//
//  NavigationView.swift
//  youchelai_swiftui
//
//  Created by Allen long on 2022/11/10.
//

import SwiftUI

struct NavigationView: View {
    
    var title: String
    
    var backgroundColor: UIColor
    
    var tapLeftCallBack: (()->())?
    
    var body: some View {
            VSStack(spacing: 0) {
                Color(backgroundColor)
                    .frame(height: statusBarH)
                HSStack {
                    Button {
                        if let callBack = tapLeftCallBack {
                            callBack()
                        } else {
                            // TODO: 默认导航返回
                        }
                    } label: {
                        Image("back_white")
                    }
                    .frame(width: 40)
                    .padding(.leading, 15)
                    
                    Spacer()
                    Text(title)
                        .font(.mFont(18, withAdapter: false))
                        .foregroundColor(.white)
                    Spacer()
                    // TODO: 根据传入参数替换下面的元素
                    Color(backgroundColor)
                        .frame(width: 40)
                        .padding(.trailing, 15)
                }
                .frame(height: 44)
                .background(Color(backgroundColor))
            }
    }
    
    init(title: String, backgroundColor: UIColor = Color_1F2129, tapLeftCallBack: (()->())? = nil) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.tapLeftCallBack = tapLeftCallBack
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
            ForEach(["iPhone 14 Pro", "iPhone 14", "iphone 8"], id: \.self) { deviceName in
                NavigationView(title: "标题", backgroundColor: Color_1F2129)
                    .previewLayout(.sizeThatFits)
            }
        }
}
