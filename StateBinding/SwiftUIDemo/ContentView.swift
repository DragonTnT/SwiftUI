//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Allen long on 2022/11/4.
//

import SwiftUI

/*
 关于State的定义，参考https://developer.apple.com/documentation/swiftui/state
 */

struct ContentView: View {
    var body: some View {
        VStack {
            Toggle("123", isOn: $isPlaying)
            Button("tap") {
                isPlaying = !isPlaying
            }
            /// 这里isPlaying属性要同步到子视图DemoView上，就需要DemoView接收绑定后的值，即`$isPlaying`
            DemoView(isOn: $isPlaying)
        }
    }
    
    /// @State变量应该放于用到`isPlaying`字段中的最顶层的父视图，并且用private标记，防止意外修改
    /// 要获取@State值，则应该使用_isPlaying
    @State private var isPlaying = false
}

struct DemoView: View {
    /// @Binding用于将变量在父视图与子视图之间传递，这样子视图能感应到父视图属性的变化
    /// @Binding值也不要初始化，而由父视图传入
     /// 要获取@Binding值，则应该使用_isOn
    @Binding var isOn: Bool
    
    var body: some View {
        Text(isOn ? "play": "pause")
    }
    
    /// 要获取@Binding值，则应该使用_isOn
    init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
