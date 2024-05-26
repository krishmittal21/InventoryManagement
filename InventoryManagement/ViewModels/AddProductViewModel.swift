//
//  AddProductViewModel.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import Foundation

class AddProductViewModel: ObservableObject {
    @Published var errorMessage: String? = ""
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var productType: ProductType = .product
    @Published var sellingPrice: Double = 0.0
    @Published var tax: Double = 0.0
    @Published var category: String = ""
    @Published var items: [IMProduct] = []
    @Published var selectedPhotoData = Data()
    @Published var isLoaded: Bool = false
    @Published var alertMessage: String = ""
    @Published var isSuccess: Bool = false
    private let urlString = "https://app.getswipe.in/api/public/add"
    private var body = Data()
    private let boundary = UUID().uuidString
    
    var finalPrice: Double {
        let totalPrice = sellingPrice + (sellingPrice * tax / 100)
        return totalPrice
    }
    
    func clearFields() {
        errorMessage = ""
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
        isLoaded = false
        
        guard !name.isEmpty, !description.isEmpty else {
            DispatchQueue.main.async {
                self.errorMessage = "Please fill in all fields"
                self.isLoaded = true
            }
            return
        }
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.isLoaded = true
            }
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let formFields: [(String, LosslessStringConvertible)] = [
            (JSONKeys.productName.rawValue, name),
            (JSONKeys.productType.rawValue, productType.rawValue),
            (JSONKeys.price.rawValue, sellingPrice),
            (JSONKeys.tax.rawValue, tax)
        ]
        
        for (key, value) in formFields {
            appendFormField(boundary: boundary, name: key, value: value)
        }
        
        if !selectedPhotoData.isEmpty {
            body.append(appendFileField(boundary: boundary, name: JSONKeys.files.rawValue, data: selectedPhotoData, filename: "image.jpg", contentType: "image/jpeg"))
        }
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.alertMessage =  "Error fetching data: \(error)"
                    self?.isLoaded = true
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    self?.alertMessage = "Server responded with an error"
                    self?.isLoaded = true
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    let responseData = try JSONDecoder().decode(IMAPIResponseData.self, from: data)
                    self?.alertMessage = "\(responseData.message)"
                    self?.isSuccess = true
                    self?.isLoaded = true
                } catch {
                    self?.alertMessage = "\(error)"
                }
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


