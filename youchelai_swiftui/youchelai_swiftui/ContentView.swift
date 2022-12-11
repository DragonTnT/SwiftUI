//
//  ContentView.swift
//  youchelai_swiftui
//
//  Created by Allen long on 2022/11/10.
//

import SwiftUI

struct ContentView: View {
    /// 搜索内容
    @State private var searchContent: String = ""
    /// 服务列表
    @State private var serviceList: [BillUserDefinedSearchService] = [
        BillUserDefinedSearchService(id: 0, icon: "service_icon", name: "更换机油更换机油更换机油更换机油更换机油更换机油更换机油更换机油更换机油更换机油更换机油更换机油", alias: "商品的别名")
    ]
    
    var body: some View {
        VSStack(spacing: 0) {
            NavigationView(title: "选择服务")
            
            HSStack() {
                Image("bill_user_defined_search")
                    .padding(.leading, adapter(5))
                TextField("", text: $searchContent)
                    .frame(height: adapter(38))
                    .font(.rFont(14))
                    .placeholder(when: searchContent.isEmpty, text: "搜索服务名称", font: .rFont(14))
                .foregroundColor(Color(Color_1F2129))
                .padding(EdgeInsets(top: 0, leading: adapter(5), bottom: 0, trailing: adapter(10)))
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding(EdgeInsets(top: adapter(20), leading: adapter(20), bottom: adapter(25), trailing: adapter(20)))
            
            List(serviceList) { service in
                BillUserDefinedCellView(service: service)
            }
            .listStyle(.plain)
            .background(Color(Color_F2F6F8))
//            .padding([.leading,.trailing], adapter(20))
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
