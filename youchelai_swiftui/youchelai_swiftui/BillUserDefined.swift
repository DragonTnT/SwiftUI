//
//  BillUserDefined.swift
//  youchelai
//
//  Created by Allen long on 2022/10/25.
//  Copyright © 2022 utimes. All rights reserved.
//

import Foundation
import HandyJSON

/// 自定义服务搜索服务
struct BillUserDefinedSearchService: HandyJSON,Identifiable {
    init() {}
    
    /// 服务id
    var id = 0
    /// 服务图标
    var icon = ""
    /// 服务名称
    var name = ""
    /// 服务别名
    var alias = ""
    
    // 自定义字段
    /// 别名显示的文案
    var aliasShowStr: String {
        if alias.isEmpty {
            return "别名 (-)"
        } else {
            return "别名 (\(alias)"
        }
    }
    
    init(id: Int, icon: String, name: String, alias: String) {
        self.id = id
        self.icon = icon
        self.name = name
        self.alias = alias
    }
}

/// 自定义服务详情
//struct BillUserDefinedServiceDetail: HandyJSON {
//    /// 服务id
//    var id = 0
//    /// 服务图片
//    var icon = ""
//    /// 服务名称
//    var name = ""
//    /// 服务描述
//    var desc = ""
//    /// 定价方式数组，1为组合定价，2为工时定价
//    var pricing: [BillServiceNature] = []
//    /// 服务是否可选数量
//    var isNum = false
//    
//    mutating func mapping(mapper: HelpingMapper) {
//        mapper <<<
//            isNum <-- "is_num"
//    }
//}
