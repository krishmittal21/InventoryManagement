//
//  IMOptionView.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI

struct IMOptionView: View {
    var title: String
    var isSelected: Bool
    var namespace: Namespace.ID
    var action: () -> Void

    var body: some View {
        ZStack(alignment: .bottom) {
            Text(title)
                .font(.callout)
                .boldMyText()
                .padding(.bottom, 10)
                .frame(minWidth: 50)

            if isSelected {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "Rectangle", in: namespace)
                    .frame(width: 50, height: 2)
                    .foregroundStyle(Color.brandBlueColor)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                action()
            }
        }
    }
}
