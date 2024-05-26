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
    @Published var search: String = ""
    private let urlString = "https://app.getswipe.in/api/public/get"
    
    var filteredProducts: [IMProduct] {
        guard !search.isEmpty else {return products}
        return products.filter { $0.productName.localizedCaseInsensitiveContains(search) }
    }

    init() { fetchProducts() }
    
    func fetchProducts() {
        isLoading = true
        
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
            let responseData = try JSONDecoder().decode([IMProduct].self, from: data)
            return responseData
        } catch {
            return nil
        }
    }
}
