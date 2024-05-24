//
//  IMProduct.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import Foundation

struct IMProduct: Codable, Hashable, Identifiable {
    
    var id = UUID()
    var image: String?
    var price: Double
    var productName: String
    var productType: String
    var tax: Double
}

var productList = [
    IMProduct(image: "https://vx-erp-product-images.s3.ap-south-amazonaws.com/9_1619635829_Farm_FreshToAvatar_Logo-01.png", price: 1694.91525424, productName: "Testing app", productType: "Product", tax: 18.0),
    IMProduct(image: "https://vx-erp-product-images.s3.ap-south-1.amazonaws.com/9_1619873597_WhatsApp_Image_2021-04-30_at_19.43.23.jpeg", price: 84745.76271186, productName: "Testing Update", productType: "Service", tax: 18.0),
    IMProduct(image: "https://vx-erp-product-images.s3.ap-south-amazonaws.com/9_1619635829_Farm_FreshToAvatar_Logo-01.png", price: 1694.91525424, productName: "Testing app", productType: "Product", tax: 14.0),
    IMProduct(image: "https://vx-erp-product-images.s3.ap-south-1.amazonaws.com/9_1619873597_WhatsApp_Image_2021-04-30_at_19.43.23.jpeg", price: 84745.76271186, productName: "Testing Update", productType: "Service", tax: 12.7),
    IMProduct(image: "https://vx-erp-product-images.s3.ap-south-amazonaws.com/9_1619635829_Farm_FreshToAvatar_Logo-01.png", price: 1694.91525424, productName: "Testing app", productType: "Product", tax: 13.0),
    IMProduct(image: "https://vx-erp-product-images.s3.ap-south-1.amazonaws.com/9_1619873597_WhatsApp_Image_2021-04-30_at_19.43.23.jpeg", price: 84745.76271186, productName: "Testing Update", productType: "Service", tax: 12.0),
    IMProduct(image: "https://vx-erp-product-images.s3.ap-south-amazonaws.com/9_1619635829_Farm_FreshToAvatar_Logo-01.png", price: 1694.91525424, productName: "Testing app", productType: "Product", tax: 11.0),
    IMProduct(image: "https://vx-erp-product-images.s3.ap-south-1.amazonaws.com/9_1619873597_WhatsApp_Image_2021-04-30_at_19.43.23.jpeg", price: 84745.76271186, productName: "Testing Update", productType: "Service", tax: 8.0)
]

enum ProductType: String, CaseIterable {
    case jj = "JJ"
    case anime = "Anime"
    case laptop = "Laptop"
    case snacks = "Snacks"
    case product = "Product"
    case smartphone = "Smartphone"
    case other = "Other"
    case wear = "Wear"
    case clothing = "Clothing"
    case grocery = "Grocery"
    case service = "Service"
    case electronics = "Electronics"
    case ptype = "Ptype"
}

enum JSONKeys: String {
    case productName = "product_name"
    case productType = "product_type"
    case price = "price"
    case tax = "tax"
    case image = "image"
}

let testImageURL = URL(string: "https://picsum.photos/400")
