//
//  AddProductViewModel.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import Foundation

class AddProductViewModel: ObservableObject {
    @Published var error: String? = ""
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var productType: ProductType = .product
    @Published var sellingPrice: Double = 0.0
    @Published var tax: Double = 0.0
    @Published var category: String = ""
    @Published var items: [IMProduct] = []
    @Published var selectedPhotoData = Data()
    @Published var isLoading: Bool = false
    private let urlString = "https://app.getswipe.in/api/public/add"
    private var body = Data()
    private let boundary = UUID().uuidString
    
    var finalPrice: Double {
        let totalPrice = sellingPrice + (sellingPrice * tax / 100)
        return totalPrice
    }
    
    func clearFields() {
        error = ""
        name = ""
        description = ""
        productType = .product
        sellingPrice = 0.0
        tax = 0.0
        category = ""
        items.removeAll()
        selectedPhotoData = Data()
    }


    func uploadProducts() {
        isLoading = true
        
        guard !name.isEmpty, !description.isEmpty else {
            error = "Please fill in all fields"
            isLoading = false
            return
        }
        
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        appendFormField(boundary: boundary, name: JSONKeys.productName.rawValue, value: name)
        appendFormField(boundary: boundary, name: JSONKeys.productType.rawValue, value: productType.rawValue)
        appendFormField(boundary: boundary, name: JSONKeys.price.rawValue, value: sellingPrice)
        appendFormField(boundary: boundary, name: JSONKeys.tax.rawValue, value: tax)
        if !selectedPhotoData.isEmpty {
            body.append(appendFileField(boundary: boundary, name: JSONKeys.files.rawValue, data: selectedPhotoData, filename: "image.jpg", contentType: "image/jpeg"))
        }
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                self?.isLoading = false
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Server responded with an error")
                self?.isLoading = false
                return
            }
            
            guard let data = data else {
                self?.isLoading = false
                return
            }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(response)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    private func appendFileField(boundary: String, name: String, data: Data, filename: String, contentType: String) -> Data {
        
        let fieldData = "--\(boundary)\r\nContent-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\"\r\nContent-Type: \(contentType)\r\n\r\n"
        body.append(fieldData.data(using: .utf8)!)
        body.append(data)
        body.append("\r\n".data(using: .utf8)!)
        return body
    }
    
    private func appendFormField<T: LosslessStringConvertible>(boundary: String,name: String, value: T) {
        let fieldData = "--\(boundary)\r\nContent-Disposition: form-data; name=\"\(name)\"\r\n\r\n\(value.description)\r\n"
        body.append(fieldData.data(using: .utf8)!)
    }
}
