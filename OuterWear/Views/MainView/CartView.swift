import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ScrollView {
            if cartManager.cartItems.count > 0 {
                ForEach(cartManager.cartItems, id: \.id) { product in
                    CartItemView(product: product)
                }
                HStack {
                    Text("Your Total is ")
                    Spacer()
                    Text("LKR\(String(format: "%.2f", cartManager.total))")
                        .bold()
                }
                .padding()

                PaymentButton(action: {})
                    .padding()

            } else {
                Text("Your Cart is Empty")
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
