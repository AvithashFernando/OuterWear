import SwiftUI

struct CartItemView: View {
//    @EnvironmentObject var cartManager: CartManager
//    var product: ProductModel
    var body: some View {
//        HStack(spacing: 20) {
//            Image(product.image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 70)
//                .cornerRadius(9)
//
//            VStack(alignment: .leading, spacing: 5) {
                Text("product.title")
//                    .bold()
//
//                Text("LKR \(product.price)")
//                    .bold()
//                }
//                .padding()
//
//
//
//                Spacer()
//
//                Image(systemName: "trash")
//                    .foregroundColor(.red)
//                    .onTapGesture {
//                        cartManager.removeFromCart(product: product)
//                    }
//            }
//            .padding(.horizontal)
//            .background(Color(.lightGray))
//            .cornerRadius(12)
//            .frame(width: .infinity, alignment: .leading)
//            .padding()
        }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView()
//            .environmentObject(CartManager())
    }
}
