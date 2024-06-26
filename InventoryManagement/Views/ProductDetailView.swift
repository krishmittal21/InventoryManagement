//
//  ProductDetailView.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: IMProduct
    @State var inStock = true
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: product.image ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Image("DefaultProductImage").resizable()
                }
                .frame(height: 300)
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Toggle("", isOn: $inStock)
                        .padding(.top, 65)
                        .padding(.trailing, 20)
                        .tint(Color.brandBlueColor)
                }
            }
            
            VStack(alignment: .leading) {
                Text("\(product.productType)")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
                Text(product.productName)
                    .font(.title2)
                    .bold()
                
                HStack(spacing: 5) {
                    ForEach(0..<5) { index in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.yellow)
                    }
                    Text("(4.5)")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Text("Total Price")
                    
                    Spacer()
                    
                    Text("\((product.price + (product.price * product.tax/100)).formattedCurrency())")
                }
                .font(.title2)
                .bold()
                .padding(.top,2)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Price Breakdown")
                            .bold()
                        
                        Text("Selling Price")
                        
                        Text("Tax")
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("")
                        
                        Text("\((product.price).formattedCurrency())")
                        
                        Text("\((product.price * product.tax/100).formattedCurrency())")
                    }
                }
                .padding(.top,2)
                .padding(.bottom,5)
                
                Text("Description")
                    .font(.title3)
                    .bold()
                
                Text(lorenIpsum)
            }
            .padding()
            
            Spacer()
            
        }
        .ignoresSafeArea(edges: .vertical)
    }
}

#Preview {
    ProductDetailView(product: productList[0])
}
