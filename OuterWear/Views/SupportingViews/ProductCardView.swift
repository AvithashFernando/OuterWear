//
//  SideCartView.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC03 on 2024-03-26.
//

import SwiftUI
import Kingfisher

struct ProductCardView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: ProductModel 
    
    var body: some View {
        ZStack {
            Color.orange.opacity(0.8)
                .cornerRadius(15)
                .padding(5)

            VStack(alignment: .leading) {
                KFImage(URL(string: product.image.first ?? ""))
                    .resizable()
                    .placeholder {
                        Image(systemName: "photo")
                            .resizable()
                            .foregroundColor(.blue)
                    }
                    .frame(width: 165, height: 150)
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
                    cartManager.addToCart(product: product)
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
        .frame(width: 170, height: 280)
    }
}

struct ProductCardView_Preview: PreviewProvider {
    static var previews: some View {
        let product = ProductModel(title: "Silk Saree with blouse piece", price: 3390, description: "Silk Satin Printed Saree With Matching Blouse Piece.Material:Silk Batik.Weight:400g", category: "Dress", gender: "WOMEN", image: ["sample_image_url"], color: ["sample_color_url"], size: ["sample_size_url"])
        
        return ProductCardView(product: product)
            .environmentObject(ProductViewModel())
    }
}
