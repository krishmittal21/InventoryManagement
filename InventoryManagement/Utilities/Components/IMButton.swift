//
//  IMButton.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI

struct IMButton: View {
    
    var buttonText: String
    var background: Color
    var textColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: .infinity, height: 50)
                    .foregroundStyle(background)
                
                Text(buttonText)
                    .bold()
                    .foregroundStyle(textColor)
            }
        }
        .padding(.horizontal,5)
    }
}
