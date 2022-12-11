//
//  BillUserDefinedCellView.swift
//  youchelai_swiftui
//
//  Created by Allen long on 2022/11/11.
//

import SwiftUI

struct BillUserDefinedCellView: View {
    
    var service: BillUserDefinedSearchService
    
    var body: some View {
        HSStack(spacing: 0) {
            Image(service.icon)
                .background(Color(Color_F2F6F8))
                .cornerRadius(6)
                .padding(EdgeInsets(top: adapter(15), leading: adapter(15), bottom: adapter(15), trailing: adapter(10)))
            VSStack(.leading) {
                Text(service.name)
                    .font(.mFont(14))
                Text(service.aliasShowStr)
                    .font(.rFont(10))
                    .foregroundColor(Color(Color_9096AB))
            }
            .padding([.top,.bottom,.trailing], adapter(15))
        }
    }
}

struct BillUserDefinedCellView_Previews: PreviewProvider {
    static var previews: some View {
            BillUserDefinedCellView(service: BillUserDefinedSearchService(id: 0, icon: "service_icon", name: "更换机油", alias: "商品的别名"))
            .background(Color.black)
    }
}
