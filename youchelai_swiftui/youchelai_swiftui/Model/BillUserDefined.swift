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
    /// 服务id
    var id = 0
    /// 服务图标
    var icon = ""
    /// 服务名称
    var name = ""
    /// 服务别名
    var alias = ""
}

