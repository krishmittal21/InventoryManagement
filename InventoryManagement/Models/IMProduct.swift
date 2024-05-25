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
    case files = "files[]"
}

let lorenIpsum = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
