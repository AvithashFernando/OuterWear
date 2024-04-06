//
//  SideCartView.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC03 on 2024-03-26.
//

import SwiftUI
import Kingfisher

struct ProductCardView: View {
    @EnvironmentObject var productViewModel: ProductViewModel
    
    var body: some View {
        if let product = productViewModel.productItems.first {
            ZStack {
                Color.gray.opacity(0.2)
                    .cornerRadius(15)

                VStack(alignment: .leading) {
                    KFImage(URL(string: product.image.first ?? ""))
                        .resizable()
                        .placeholder {
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundColor(.blue)
                        }
                        .frame(width: 175, height: 160)
                        .cornerRadius(12)

                    Text(product.title)
                        .font(.system(size: 15))
                        .foregroundColor(.black)

                    Text("LKR \(String(format: "%.2f", product.price))")
                        .foregroundColor(.black)
                        .bold()
                        .padding(.bottom, 5)

                    Button(action: {
                        // Action to add product to cart
                        print("Added to cart: \(product.title)")
                    }) {
                        Text("Add to cart")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .frame(width: 195, height: 300)
        } else {
            Text("No product available")
                .foregroundColor(.red)
        }
    }
}

struct ProductCardView_Preview: PreviewProvider {
    static var previews: some View {
        let productViewModel = ProductViewModel()
        productViewModel.productItems = [ProductModel(title: "Sample Product", price: 20, description: "Sample Description", category: "Sample Category", gender: "Sample Gender", image: ["sample_image_url"])]
        
        return ProductCardView()
            .environmentObject(productViewModel)
    }
}
