//
//  ContentView.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI

struct MainView: View {
    @StateObject private var networkManager = NetworkManager()
    
    var body: some View {
        
        if networkManager.isConnected {
            ProductsListingView()
        } else {
            NoNetworkView()
        }
    }
}

#Preview {
    MainView()
}
