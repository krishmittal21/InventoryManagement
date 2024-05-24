//
//  IMProductCardView.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI

struct IMProductCardView: View {
    
    var product: IMProduct
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                // The API contains image: "" no links given, for testing use testImageURL
                AsyncImage(url: URL(string: product.image!)) { image in
                    image.resizable()
                } placeholder: {
                    Image("DefaultProductImage").resizable()
                }
                .frame(width: 175,height: 160)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(colorScheme == .dark ? .white : .gray, lineWidth: 0.5)
                )
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(product.productName)
                            .font(.subheadline)
                            .padding(.vertical, 1)
                        
                        Text("\((product.price + (product.price * product.tax/100)).formattedCurrency())")
                            .font(.caption2)
                    }
                    
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 20,height: 25)
                            .padding(.trailing)
                    }
                }
            }
        }
        .frame(width: 185, height: 260)
        .cornerRadius(15)
    }
}

#Preview {
    IMProductCardView(product: productList[1])
}
