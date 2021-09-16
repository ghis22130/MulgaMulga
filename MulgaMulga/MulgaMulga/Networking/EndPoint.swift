//
//  EndPoint.swift
//  MulgaMulga
//
//  Created by 지북 on 2021/09/14.
//

import Foundation

protocol EndPoint {
    func path() -> String
}

struct LNEndPoint: EndPoint {
    private let baseURL = "http://openapi.seoul.go.kr:8088"
    private let key = ""
    private let type: RequestFileType
    private let service = "ListNecessariesPricesService"
    private let startIndex: String
    private let endIndex: String
    private let marketName: String?
    private let productName: String?
    private let inspectionYearAndMonth: String?
    private let marketTypeName: String?
    private let guName: String?
    
    init(type: RequestFileType, startIndex: Int, endIndex: Int, marketName: String? = nil, productName: String? = nil, inspectionYearAndMonth: String? = nil, marketTypeName: String? = nil, guName: String? = nil) {
        self.type = type
        self.startIndex = String(startIndex)
        self.endIndex = String(endIndex)
        self.marketName = marketName
        self.productName = productName
        self.inspectionYearAndMonth = inspectionYearAndMonth
        self.marketTypeName = marketTypeName
        self.guName = guName
    }
    
    func path() -> String {
        let essential = [baseURL, key, type.rawValue, service, startIndex, endIndex].joined(separator: "/")
        let option = [marketName, productName, inspectionYearAndMonth, marketTypeName, guName].compactMap { $0 }.joined(separator: "/")
        
        return essential + "/" + option
    }
}

enum RequestFileType: String {
    case xml = "xml"
    case xmlf = "xls"
    case json = "json"
}
