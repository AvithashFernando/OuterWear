import SwiftUI
import Kingfisher

struct CartItemView: View {
    @EnvironmentObject var cartManager: CartManager
    @StateObject var productViewModel = ProductViewModel()
    
    var product: ProductModel
    
    init(product: ProductModel) {
        self.product = product
    }
    
    var body: some View {
        if let product = productViewModel.productItems.first {
            HStack(spacing: 20) {
                if let imageURL = product.image.first {
                    KFImage(URL(string: imageURL))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                        .cornerRadius(9)
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text(product.title)
                        .bold()

                    Text("LKR \(product.price)")
                        .bold()
                }
                .padding()

                Spacer()

                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .onTapGesture {
                        cartManager.removeFromCart(product: product)
                    }
            }
            .padding(.horizontal)
            .background(Color(.lightGray))
            .cornerRadius(12)
            .frame(width: .infinity, alignment: .leading)
            .padding()
        } else {
 
            Text("No product available")
        }
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        let product = ProductModel(title: "Silk Saree with blouse piece", price: 3390, description: "Silk Satin Printed Saree With Matching Blouse Piece.Material:Silk Batik.Weight:400g", category: "Dress", gender: "WOMEN", image: ["sample_image_url"], color: ["sample_color_url"], size: ["sample_size_url"])
        
        return CartItemView(product: product)
            .environmentObject(ProductViewModel())
    }
}
