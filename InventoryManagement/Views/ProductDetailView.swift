//
//  ProductDetailView.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: IMProduct
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                // The API contains image: "" no links given, for testing use testImageURL
                AsyncImage(url: URL(string: product.image!)) { image in
                    image.resizable()
                } placeholder: {
                    Image("DefaultProductImage").resizable()
                }
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
                
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.top, 65)
                    .padding(.trailing, 20)
                    .foregroundStyle(Color.brandBlueColor)
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
                        Text("Breakdown")
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
            }
            .padding()
            
            Spacer()
            
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ProductDetailView(product: productList[0])
}
