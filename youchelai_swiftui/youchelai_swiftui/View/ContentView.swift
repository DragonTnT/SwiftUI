//
//  ContentView.swift
//  youchelai_swiftui
//
//  Created by Allen long on 2022/11/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var dataSource: [BillUserDefinedSearchService] = []
    /// 是否正在加载
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationView(title: "选择服务")
            if isLoading {
                LoadingView()
            } else {
                HStack(spacing: 0) {
                    Image("service_search")
                        .padding(.horizontal, 5)
                    TextField("", text: $username)
                        .frame(height: adapter(38))
                        .font(.rFont(14))
                        .placeholder(when: username.isEmpty, text: "搜索服务名称", font: .rFont(14), color: Color(Color_9096AB))
                        .foregroundColor(Color(Color_1F2129))
                }

                .background(Color.white)
                .cornerRadius(8)
                .padding(EdgeInsets.init(top: adapter(20), leading: adapter(20), bottom: adapter(25), trailing: adapter(20)))
                if dataSource.isEmpty {
                    Color(Color_F2F6F8)
                } else {
                    List {
                        ForEach(dataSource) { source in
                            ServiceRow(service: source)
                        }
                    }
                    .listStyle(.inset)
                    .listBackgroundColor(color: Color(Color_F2F6F8))
                }
                
            }
        }
        .background(Color(Color_F2F6F8))
        .ignoresSafeArea()
        
    }
    
    func getList()  {
        isLoading = true
        delay(1) {
            isLoading = false
            let service = BillUserDefinedSearchService(id: 10,
                                         icon: "https://img0.baidu.com/it/u=1250551608,2180019998&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                                         name: "更换机油",
                                         alias: "我是别名")
            dataSource.append(service)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
