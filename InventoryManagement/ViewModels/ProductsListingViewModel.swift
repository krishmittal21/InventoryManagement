//
//  ProductsListingViewModel.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import Foundation

class ProductsListingViewModel: ObservableObject {
    
    @Published var products: [IMProduct] = []
    @Published var isLoading: Bool = false
    
    init() { fetchProducts() }
    
    func fetchProducts() {
        isLoading = true
        
        let urlString = "https://app.getswipe.in/api/public/get"
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
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
            
            if let data = data, let products = self?.parseJSONData(data) {
                DispatchQueue.main.async {
                    self?.products = products
                    self?.isLoading = false
                }
            } else {
                self?.isLoading = false
            }
        }.resume()
    }
    
    func parseJSONData(_ data: Data) -> [IMProduct]? {
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data) as? [[String: Any]]
            var products = [IMProduct]()
            
            jsonArray?.forEach { dict in
                if let name = dict[JSONKeys.productName.rawValue] as? String,
                   let type = dict[JSONKeys.productType.rawValue] as? String,
                   let price = dict[JSONKeys.price.rawValue] as? Double,
                   let tax = dict[JSONKeys.tax.rawValue] as? Double,
                   let imageURL = dict[JSONKeys.image.rawValue] as? String {
                    let product = IMProduct(id: UUID(), image: imageURL, price: price, productName: name, productType: type, tax: tax)
                    products.append(product)
                }
            }
            
            return products
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
