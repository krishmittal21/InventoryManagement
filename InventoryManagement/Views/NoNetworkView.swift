//
//  NoNetworkView.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 25/05/24.
//

import SwiftUI

struct NoNetworkView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "wifi")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
            
            Text("You need Internet Connection to run the Application")
                .font(.title)
                .padding()
                .foregroundStyle(.white)
            
            Spacer()
        }
        .background(Color.brandBlueColor)
    }
}

#Preview {
    NoNetworkView()
}
