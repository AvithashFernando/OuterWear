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

//    func addToCart(productViewModel: ProductViewModel) {
//        id.append(product)
//        total += product.price
//    }
//
//    func removeFromCart(productViewModel: ProductViewModel) {
//        products = products.filter { $0.id != productItems.id}  //LKR?
//        total -= product.price
//    }
}

