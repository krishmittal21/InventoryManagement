//
//  IMAPIResponseData.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 25/05/24.
//

import Foundation

struct IMAPIResponseData: Codable {
    let message: String
    let productDetails: IMProduct
    let productId: Int
    let success: Bool

    enum CodingKeys: String, CodingKey {
        case message
        case productDetails = "product_details"
        case productId = "product_id"
        case success
    }
}
