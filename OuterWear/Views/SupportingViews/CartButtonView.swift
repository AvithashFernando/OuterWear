//
//  CartButtonView.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC07 on 2024-03-31.
//

import SwiftUI

struct CartButtonView: View {
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "bag.fill")
                .foregroundColor(.black)
                .padding(5)
            if numberOfProducts > 0 {
                    Text("\(numberOfProducts)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .frame(width: 15, height: 15)
                        .background(.red)
                        .cornerRadius(50)
            }
        }
    }
}

struct CartButtonView_Preview: PreviewProvider {
    static var previews: some View {
        let product = ProductModel(title: "Sample Product", price: 10.0, description: "Sample Description", category: "Sample Category", gender: "Sample Gender", image: ["sample_image_url"], color: ["sample_color_url"], size: ["sample_size_url"])
        let cartManager = CartManager()
        cartManager.addToCart(product: product)
        
        return CartButtonView(numberOfProducts: cartManager.cartItems.count)
            .environmentObject(cartManager)
    }
}
