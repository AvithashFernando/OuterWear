import SwiftUI
import Alamofire
import Kingfisher

struct ProductDetailsView: View {

    @State private var selectedSize: String?
    @StateObject var productViewModel = ProductViewModel()
    var product: ProductModel
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.white

                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing) {
                        if let firstProduct = productViewModel.productItems.first {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 0) {
                                            ForEach(firstProduct.image, id: \.self) { imageURLString in
                                                KFImage(URL(string: imageURLString))
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: UIScreen.main.bounds.width, height: 300)
                                                    .clipped()
                                            }
                                            .padding(.top, 50)
                                        }
                                    }
                                    .edgesIgnoringSafeArea(.horizontal)
                        }

                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.top, 63)
                            .padding(.trailing, 20)
                    }
    
                    VStack(alignment: .leading) {
                        HStack {
                            if let firstProduct = productViewModel.productItems.first {
                                Text(firstProduct.title)
                                    .font(.title2)

                                
                                Spacer()
                                
                                Text("LKR.\(String(format: "%.2f", productViewModel.productItems.first?.price ?? 0))")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal)
                                    .background(Color(.orange))
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.vertical)

                        HStack {
                            HStack(spacing: 10) {
                                ForEach(0..<5) {index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 20,height: 20)
                                        .foregroundColor(.yellow)
                                }
                                Text("(4.5)")
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical)

                            Spacer()

                            HStack {
                                Button(action: {}, label: {
                                    Image(systemName: "minus.square")
                                        .foregroundColor(Color(.gray))
                                })
                                Text("1")
                                Button(action: {}, label: {
                                    Image(systemName: "plus.square")
                                        
                                })
                            }
                        }

                        Text("Description")
                            .font(.title3)
                            .fontWeight(.medium)

                        if let firstProduct = productViewModel.productItems.first {
                            Text(firstProduct.description)
                        }
                        Spacer()
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Size")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                
                                if let firstProduct = productViewModel.productItems.first {
                                    LazyHGrid(rows: [GridItem(.fixed(50))], spacing: 10) {
                                        ForEach(firstProduct.size, id: \.self) { size in
                                            Button(action: {
                                                if selectedSize == size {
                                                    
                                                    selectedSize = nil
                                                } else {
                                                    selectedSize = size
                                                }
                                            }) {
                                                Text(size)
                                                    .foregroundColor(.white)
                                                    .fixedSize()
                                                    .padding(10)
                                                    .background(selectedSize == size ? Color.blue : Color.gray)
                                                    .clipShape(Circle())
                                                    .overlay(
                                                        Circle()
                                                            .stroke(selectedSize == size ? Color.blue : Color.clear, lineWidth: 2)
                                                    )
                                            }
                                            .frame(width: 50, height: 50)
                                            .padding(.bottom, 5)
                                        }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                        }

                        VStack(alignment: .leading) {
                            Text("Colors")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            
                            if let firstProduct = productViewModel.productItems.first {
                                LazyHGrid(rows: [GridItem(.fixed(50))], spacing: 10) {
                                    ForEach(firstProduct.color, id: \.self) { color in
                                        ColorDotView(color: Color(color))
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }

                        PaymentButton(action: {})
                            .frame(width: .infinity, height: 35)

                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .offset(y: -30)

                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ProductDetailsView_preview: PreviewProvider {
    static var previews: some View {
        let product = ProductModel(title: "Silk Saree with blouse piece", price: 3390, description: "Silk Satin Printed Saree With Matching Blouse Piece.Material:Silk Batik.Weight:400g", category: "Dress", gender: "WOMEN", image: ["sample_image_url"], color: ["sample_color_url"], size: ["sample_size_url"])
        
        return ProductDetailsView(product: product)
            .environmentObject(ProductViewModel())
        
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .padding(.bottom, 5)
    }
}

//#Preview {
//    ProductDetailsView()
//}
//   
