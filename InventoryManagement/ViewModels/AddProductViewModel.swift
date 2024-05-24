//
//  AddProductViewModel.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import Foundation

class AddProductViewModel: ObservableObject {
    @Published var error: String = ""
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var productType: ProductType = .product
    @Published var sellingPrice: Double = 0.0
    @Published var tax: Double = 0.0
    @Published var imageURL: String = ""
    @Published var category: String = ""
    @Published var items: [IMProduct] = []
    @Published var selectedPhotoData = Data()
    
    var finalPrice: Double {
            let totalPrice = sellingPrice + (sellingPrice * tax / 100)
            return totalPrice
        }
}
