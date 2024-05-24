//
//  NumberFormatterExtension.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 24/05/24.
//

import Foundation

extension NumberFormatter {
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
}
