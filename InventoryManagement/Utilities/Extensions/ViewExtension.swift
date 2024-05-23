//
//  ViewExtension.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI

struct BoldTextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .bold()
        } else {
            content
        }
    }
}

extension View {
    func boldMyText() -> some View {
        modifier(BoldTextModifier())
    }
}
