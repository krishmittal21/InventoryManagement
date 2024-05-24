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
    @State private var selectedOption = "In Stock"
    @Namespace private var namespace
    private var columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var selectedProduct: IMProduct?
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    header
                    
                    searchBar
                    
                    optionSelector
                    
                    if viewModel.isLoading {
                        Spacer()
                        ProgressView().tint(Color.brandBlueColor)
                        Spacer()
                    } else {
                        productListing
                    }
                    
                    Spacer()
                }
                .ignoresSafeArea(.container, edges: .bottom)
                
                addProductButton
            }
            .sheet(isPresented: $showAddProduct, content: {
                AddProductView()
            })
            .sheet(item: $selectedProduct) { product in
                ProductDetailView(product: product)
            }
            
        }
    }
}

extension ProductsListingView {
    
    @ViewBuilder
    var productListing: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.products) { product in
                    IMProductCardView(product: product)
                        .onTapGesture {
                            selectedProduct = product
                        }
                }
            }
            .padding(.horizontal, 15)
        }
    }
    
    @ViewBuilder
    var optionSelector: some View {
        HStack(spacing: 50, content: {
            IMOptionView(title: "In Stock", isSelected: selectedOption == "In Stock", namespace: namespace, action: {
                selectedOption = "In Stock"
            })
            
            IMOptionView(title: "Out of Stock", isSelected: selectedOption == "Out of Stock", namespace: namespace, action: {
                selectedOption = "Out of Stock"
            })
            
            IMOptionView(title: "Category", isSelected: selectedOption == "Category", namespace: namespace,  action: {
                selectedOption = "Category"
                
            })
        })
        .padding()
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
                .bold()
            
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
                    .bold()
                }
            }
            .padding(.bottom,10)
        }
    }
}

#Preview {
    ProductsListingView()
}
