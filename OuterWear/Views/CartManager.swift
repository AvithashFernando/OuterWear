//
//  CartManager.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC07 on 2024-03-31.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var cartItems: [ProductModel] = []

    @Published private(set) var total: Int = 0

    func addToCart(product: ProductModel) {
        cartItems.append(product)
        total += Int(product.price)
    }

    func removeFromCart(product: ProductModel) {
        if let index = cartItems.firstIndex(where: { $0.id == product.id }) {
            cartItems.remove(at: index)
            total -= Int(product.price)
        }
    }
}
