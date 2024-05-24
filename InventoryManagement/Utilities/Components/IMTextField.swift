//
//  IMTextField.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI

struct IMTextField: View {
    @Binding var text: String
    let title: String
    let axis: Axis

    var body: some View {
        VStack(alignment: .leading) {
            TextField(title, text: $text, axis: axis)
                .lineLimit(2...15)
                .font(.system(.title3, design: .rounded))
                .padding(15)
                .background(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
        }
    }
}
