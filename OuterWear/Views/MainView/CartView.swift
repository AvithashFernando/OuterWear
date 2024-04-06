import SwiftUI

struct CartView: View {
//    @EnvironmentObject var cartManager: CartManager
//    @StateObject var productViewModel = ProductViewModel()
    var body: some View {
//        ScrollView{
//            if cartManager.products.count > 0{
//                ForEach(cartManager.products, id: \.id) {product in
//                    CartItemView(ProductViewModel.productItems)
//                }
//                HStack{
                    Text("Your Total is ")
//                    Spacer()
//                    Text("LKR\(cartManager.total).00")
//                        .bold()
//                }
//                .padding()
//
//                PaymentButton(action: {})
//                    .padding()
//
//            } else {
//                Text("Your Cart is Empty")
//            }
//        }
//        .navigationTitle(Text("My Cart"))
//        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
//        CartView(product: productList[2])
//            .environmentObject(CartManager())
    }
}
