//
//  ProductsListingView.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI

struct ProductsListingView: View {
    
    @StateObject private var viewModel = ProductsListingViewModel()
    
    var body: some View {
        ZStack {
            addProductButton
        }
    }
    
    @ViewBuilder
    var addProductButton: some View {
        VStack {
            Spacer()
            
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 170, height: 50)
                        .foregroundStyle(Color.brandBlueColor)
                    
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Product")
                    }
                    .foregroundStyle(.white)
                    .boldMyText()
                }
            }
            .padding(.bottom,10)
        }
    }
}

#Preview {
    ProductsListingView()
}
