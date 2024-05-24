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
    @Published var price: Int = 0
    @Published var imageURL: String = ""
    @Published var category: String = ""
    @Published var items: [IMProduct] = []
    @Published var selectedPhotoData = Data()
}
