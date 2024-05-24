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
            if #available(iOS 16.0, *) {
                TextField(title, text: $text, axis: axis)
                    .textFieldStyle()
                    .lineLimit(2...15)
            } else {
                TextField(title, text: $text)
                    .textFieldStyle()
            }
        }
    }
}
