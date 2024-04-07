//
//  CategoryViewModel.swift
//  OuterWear
//
//  Created by NIBMPC04PC03 on 2024-04-07.
//

import Foundation
import Alamofire

class CategoryViewModel: ObservableObject {
    @Published var categories = [CategoryModel]()
    @Published var dataLoaded = false
    
    init() {
        fetchData()
    }

    func fetchData() {
        AF.request("https://onlineclothingapi.onrender.com/api/categories").responseDecodable(of: [CategoryModel].self) { response in
            switch response.result {
            case .success(let data):
                self.categories = data
                self.dataLoaded = true
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
