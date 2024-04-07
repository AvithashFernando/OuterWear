import Foundation
import Alamofire

class ProductViewModel: ObservableObject {
    @Published var productItems = [ProductModel]()
    @Published var dataLoaded = false
    
    init(){
        fetchData()
        print("hello2")
    }

    func fetchData() {
        print("hello")
        AF.request("https://onlineclothingapi.onrender.com/api/products").responseDecodable(of: [ProductModel].self) { response in
            switch response.result {
            case .success(let data):
                
                self.productItems = data
                self.dataLoaded = true
                print(data)
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
