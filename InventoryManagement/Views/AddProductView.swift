//
//  AddProductView.swift
//  InventoryManagement
//
//  Created by Krish Mittal on 23/05/24.
//

import SwiftUI
import PhotosUI

struct AddProductView: View {
    
    @StateObject private var viewModel = AddProductViewModel()
    @State private var photoPickerItems = [PhotosPickerItem]()
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
                ScrollView {
                    VStack {
                        HStack {
                            Text("Upload photos")
                                .font(.system(.subheadline, design: .rounded))
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            addPhotosButton
                        }
                    }
                    
                    displayPhotos
                    
                }
                .padding()
                .navigationTitle("Add Product")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

// Photo Picker
extension AddProductView {
    
    @ViewBuilder
    var displayPhotos: some View {
        if viewModel.selectedPhotoData.count > 0 {
            Image(uiImage: UIImage(data: viewModel.selectedPhotoData)!)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .cornerRadius(5)
                .frame(maxWidth: .infinity)
            
        } else {
            ZStack {
                Color.gray.opacity(0.2)
                
                Rectangle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [3]))
                
                Text("Add Photos")
                    .font(.system(.subheadline, design: .rounded))
            }
            .foregroundStyle(.gray)
            .cornerRadius(5)
            .frame(width: 150, height: 150)
        }
    }
    
    @ViewBuilder
    var addPhotosButton: some View {
        PhotosPicker(
            selection: $photoPickerItems,
            maxSelectionCount: 1,
            matching: .images
        ) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 60, height: 40)
                    .foregroundStyle(Color.brandBlueColor)
                Text("Add")
                    .font(.system(.title3, design: .rounded))
                    .bold()
                    .foregroundStyle(Color.white)
            }
        }
        .onChange(of: photoPickerItems) { items in
            Task {
                viewModel.selectedPhotoData.removeAll()
                for item in items {
                    if let imageData = try await item.loadTransferable(type: Data.self) {
                        viewModel.selectedPhotoData.append(imageData)
                    }
                }
            }
        }
    }
}


#Preview {
    AddProductView()
}
