//
//  ContentView.swift
//  youchelai_swiftui
//
//  Created by Allen long on 2022/11/10.
//

import SwiftUI
import Combine
import AlertToast

struct ContentView: View {
    
    @ObservedObject var vm = CustomServiceViewModel()

    var body: some View {
        VStack(spacing: 0) {
            NavigationView(title: "选择服务")
            VStack(spacing: 0) {
                ZStack {
                    HStack(spacing: 0) {
                        Image("service_search")
                            .padding(.horizontal, 5)
                        UIKitTextField("",  text: Binding<String>(
                            get: { vm.searchContent },
                                set: {
                                    vm.searchContent = $0
                                    // 这里如果要实现中文搜索中的拼音不搜索，需要用到marketTextRange，那么Textfiled应该使用由UITextfield封装的控件
                                    vm.search($0)
                                }))
                            .frame(height: adapter(38))
                            .font(.rFont(14))
                            .placeholder(when: vm.searchContent.isEmpty, text: "搜索服务名称", font: .rFont(14), color: Color(Color_9096AB))
                            .foregroundColor(Color(Color_1F2129))
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(EdgeInsets.init(top: adapter(20), leading: adapter(20), bottom: adapter(25), trailing: adapter(20)))
                    .onReceive(vm.$isLoading) { output in
                        
                    }
                    
                    if vm.isLoading {
                        ProgressView().padding(.top, adapter(60))
                    }
                }
                if vm.services.isEmpty {
                    Color(Color_F2F6F8)
                } else {
                    List {
                        ForEach(vm.services) { source in
                            ServiceRow(service: source)
                        }
                    }
                    .listStyle(.inset)
                    .listBackgroundColor(color: Color(Color_F2F6F8))
                }
            }.toast(vm.loadError?.msg, isPresenting: $vm.isShowingError)
        }
        .background(Color(Color_F2F6F8))
        .ignoresSafeArea()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
