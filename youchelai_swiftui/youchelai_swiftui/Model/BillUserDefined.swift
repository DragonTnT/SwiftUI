//
//  BillUserDefined.swift
//  youchelai
//
//  Created by Allen long on 2022/10/25.
//  Copyright © 2022 utimes. All rights reserved.
//

import Foundation
import HandyJSON


class CustomServiceViewModel: ObservableObject {
    @Published var searchContent: String = ""
    @Published var services: [BillUserDefinedSearchService] = []
    @Published var isLoading = false
    /// 用于接受网络请求失败的返回值
    @Published var loadError: (code: Int, msg: String)?
    @Published var isShowingError = false
    
    func search(_ searchContent: String) {
        if searchContent.isEmpty {
            services = []
            return
        }
        isLoading = true
        delay(1) {
            let service = BillUserDefinedSearchService(id: 10,
                                         icon: "https://img0.baidu.com/it/u=1250551608,2180019998&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                                         name: "更换机油",
                                         alias: "我是别名")
            self.services = [service]
            self.isLoading = false
            
            /// 出错的情况
//            self.loadError = (code: 1000, msg: "出错啦")
//            self.isShowingError = false
            
            
        }
    }
}

/// 自定义服务搜索服务
struct BillUserDefinedSearchService: HandyJSON,Identifiable {
    /// 服务id
    var id = 0
    /// 服务图标
    var icon = ""
    /// 服务名称
    var name = ""
    /// 服务别名
    var alias = ""
}

