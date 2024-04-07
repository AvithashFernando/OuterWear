import SwiftUI
import Alamofire

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

                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10) {
                            ForEach(productViewModel.productItems) { product in
                                NavigationLink {
//                                    ProductCardView(product: product)
                                } label: {
                                    ProductCardView()
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
            Task {
                print("hello3")
                productViewModel.fetchData()
            }
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

//                    NavigationLink(destination: CartView()
//                        .environmentObject(cartManager)
//                    ) {
////                        CartButtonView(numberOfProducts: cartManager.products.count)
//                    }
                }
                Text("Elevate Your Style with ")
                        .font(.largeTitle .bold())
                    
                    + Text("Outerwear")
                        .font(.largeTitle .bold())
                        .foregroundColor(Color(.red))

                    Text("Elegance")
                        .font(.largeTitle .bold())
            }
        }
        .padding()
        .environmentObject(CartManager())

    }

}


//#Preview {
//    HomeView()
//}
                    
