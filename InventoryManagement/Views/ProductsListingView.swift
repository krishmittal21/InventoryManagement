//
//  ProductsListingView.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI

struct ProductsListingView: View {
    
    @StateObject private var viewModel = ProductsListingViewModel()
    @State private var showAddProduct: Bool = false
    @State private var search: String = ""
    
    var body: some View {
        ZStack {
            addProductButton
            
            VStack {
                header
                
                searchBar
                
                Spacer()
            }
        }
        .sheet(isPresented: $showAddProduct, content: {
            AddProductView()
        })
    }
    
    @ViewBuilder
    var searchBar: some View {
        HStack {
            HStack {
                TextField("Search For Your Products", text: $search)
                    .padding()
                
                Image(systemName: "magnifyingglass")
                    .padding(.trailing)
                
            }
            .background(Color.brandBlueColor.opacity(0.2))
            .cornerRadius(12)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    var header: some View {
        HStack {
            Image("Person")
                .resizable()
                .frame(width: 40, height: 40)
            
            Text("Your Products")
                .font(.title2)
                .boldMyText()
            
            Spacer()
        }
        .padding(.vertical,10)
        .padding(.horizontal,20)
    }
    
    @ViewBuilder
    var addProductButton: some View {
        VStack {
            Spacer()
            
            Button {
                showAddProduct.toggle()
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
