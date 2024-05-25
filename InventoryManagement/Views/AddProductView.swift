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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
                ScrollView {
                    
                    productPhotoPicker
                    
                    if let error = viewModel.error {
                        Text(error)
                            .foregroundStyle(.red)
                    }
                    
                    inputProductDetails
                    
                }
                .padding()
                
                Divider()
                
                HStack {
                    IMButton(buttonText: "Save", background: Color.brandBlueColor, textColor: .white) {
                        viewModel.uploadProducts()
                    }
                    
                    IMButton(buttonText: "Add Another", background: Color.brandBlueColor.opacity(0.2), textColor: Color.brandBlueColor) {
                        
                    }
                }
                .padding()
                .navigationTitle("Add Product")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
    }
}

extension AddProductView {
    @ViewBuilder
    var inputProductDetails: some View {
        VStack(alignment: .leading, spacing: 10) {
            Picker("Category", selection: $viewModel.productType) {
                ForEach(ProductType.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.menu)
            
            TextField("Item Name", text: $viewModel.name)
                .customTextFieldStyle()
            
            TextField("Description", text: $viewModel.description, axis: .vertical)
                .customTextFieldStyle()
            
            VStack(alignment: .leading) {
                Text("Price")
                    .foregroundStyle(.gray)
                
                TextField("Price", value: $viewModel.sellingPrice, formatter: NumberFormatter.currencyFormatter)
                    .customTextFieldStyle()
            }
            
            VStack(alignment: .leading)  {
                Text("Tax Rate")
                    .foregroundStyle(.gray)
                
                TextField("Tax", value: $viewModel.tax, formatter: NumberFormatter.currencyFormatter)
                    .customTextFieldStyle()
            }
            
            Text("Final Price: \(viewModel.finalPrice.formattedCurrency())")
        }
    }
}

// Photo Picker
extension AddProductView {
    
    @ViewBuilder
    var productPhotoPicker: some View {
        PhotosPicker(
            selection: $photoPickerItems,
            maxSelectionCount: 1,
            matching: .images
        ) {
            if viewModel.selectedPhotoData.count > 0 {
                Image(uiImage: UIImage(data: viewModel.selectedPhotoData)!)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .cornerRadius(5)
                    .overlay(alignment: .topTrailing) {
                        Image(systemName: "pencil.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(Color.brandBlueColor)
                            .offset(x: 10, y: -10)
                    }
                    .padding(.vertical, 10)
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
