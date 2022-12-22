//
//  ServiceRow.swift
//  youchelai_swiftui
//
//  Created by longfan on 2022/11/27.
//

import SwiftUI
//import Kingfisher
import Kingfisher

struct ServiceRow: View {
    
    let service: BillUserDefinedSearchService
    
    init(service: BillUserDefinedSearchService) {
        self.service = service
    }
    
    var body: some View {
        HStack(spacing: 0) {
            KFImage(URL(string: service.icon))
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 24, trailing: 10))
            VStack(alignment: .leading, spacing: 10) {
                Text(service.name)
                HStack(spacing: 5) {
                    Text("别名")
                    Text(service.alias)
                }
                
            }
            .padding(.vertical, 15)
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 20)        
        .padding(.bottom, 10)
        .background(Color(Color_F2F6F8))
        .listRowInsets(EdgeInsets())
        .noSeparator()
        
    }
}

struct ServiceRow_Previews: PreviewProvider {
    static var previews: some View {
        var service = BillUserDefinedSearchService()
        service.id = 10
        service.icon = "https://img0.baidu.com/it/u=1250551608,2180019998&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
        service.name = "更换机油"
        service.alias = "我是别名"
        return ServiceRow(service: service)
    }
}
