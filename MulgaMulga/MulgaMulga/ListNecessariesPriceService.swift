//
//  ListNecessariesPriceService.swift
//  MulgaMulga
//
//  Created by 지북 on 2021/09/14.
//

import Foundation

struct ListNecessariesPricesService: Decodable {
    let listTotalCount: Int
    let result: ServiceResult
    let row: ListNecessariesDTO
    
    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case row
    }
}

struct ServiceResult: Decodable {
    let code: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}

struct ListNecessariesDTO: Decodable {
    let dataID: Double
    let marketID: Double
    let marketName: String
    let productID: Double
    let productName: String
    let productUnit: String
    let productPrice: String
    let inspectionYearAndMonth: String
    let note: String
    let inspectionDate: String
    let maretTypeCode: Double
    let marketTypeName: String
    let guCode: Double
    let guName: String
    
    enum CodingKeys: String, CodingKey {
        case dataID = "P_SEQ"
        case marketID = "M_SEQ"
        case marketName = "M_NAME"
        case productID = "A_SEQ"
        case productName = "A_NAME"
        case productUnit = "A_UNIT"
        case productPrice = "A_PRICE"
        case inspectionYearAndMonth = "P_YEAR_MONTH"
        case note = "ADD_COL"
        case inspectionDate = "P_DATE"
        case maretTypeCode = "M_TYPE_CODE"
        case marketTypeName = "M_TYPDE_NAME"
        case guCode = "M_GU_CODE"
        case guName = "M_GU_NAME"
    }
}
