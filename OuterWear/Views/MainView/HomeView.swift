import SwiftUI
import Kingfisher


struct HomeView: View {
    @StateObject private var productViewModel = ProductViewModel()
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Header()

                    SearchView()

                    ImageSliderView()

                    HStack {
                        Text("New Arrival")
                            .font(.title)
                            .fontWeight(.medium)

                        Spacer()

                        NavigationLink(destination: ProductView()) {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundColor(Color(.black))
                        }
                    }
                    .padding()

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 25) {
                            ForEach(productViewModel.productItems) { product in
                                NavigationLink(destination: ProductDetailsView(product: product)) {
                                    ProductCardView(product: product)
                                    
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .environmentObject(cartManager)
        .onAppear {
            productViewModel.fetchData() 
        }
    }
}



struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CartManager())
    }
}

struct Header: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName:"location.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)

                    Text("Colombo, SL")
                        .font(.system(size: 20))
                        .font(.title3)
                        .foregroundColor(.gray)

                    Spacer()

                    NavigationLink(destination: CartView()
                        .environmentObject(cartManager)
                    ) {
                        CartButtonView(numberOfProducts: cartManager.cartItems.count)
                    }
                }
                Text("Elevate Style with ")
                        .font(.title3 .bold())
                    
                    + Text("Outerwear")
                        .font(.title .bold())
                        .foregroundColor(Color(.red))

                    Text("Elegance")
                        .font(.title .bold())
            }
        }
        .padding()
        .environmentObject(CartManager())

    }

}


#Preview {
    HomeView()
}
                    
