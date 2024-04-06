//
//  SideMenuView.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC03 on 2024-03-26.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var productViewModel: ProductViewModel

    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(productViewModel.productItems, id: \.id) { product in
                        //ProductCardView(product: product) // Pass product, not ProductModel
                    }
                }
                .padding()
            }
            .navigationTitle("All New Arrival") // Use navigationTitle, not NavigationTitle
        }
    }
}

struct ProductView_Preview: PreviewProvider {
    static var previews: some View {
        ProductView()
            .environmentObject(CartManager())
            .environmentObject(ProductViewModel())
    }
}
