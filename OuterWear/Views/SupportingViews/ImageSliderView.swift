//
//  ImageSliderView.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC07 on 2024-03-31.
//

import SwiftUI
import Kingfisher

struct ImageSliderView: View {
    
    @StateObject private var productViewModel = ProductViewModel()
    @State private var currentIndex = 0

    var limit = 2// Set the limit to the number of images you want to display
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .trailing) {
                ForEach(productViewModel.productItems.prefix(limit), id: \.title) { clothing in
                    KFImage(URL(string: clothing.image[currentIndex % clothing.image.count]))
                        .resizable()
                        .frame(width: .infinity, height: 180)
                        .scaledToFit()
                        .cornerRadius(15)
                }
            }
            .padding()
            
            HStack {
                Spacer()
                ForEach(0..<min(productViewModel.productItems.count, limit), id: \.self) { index in
                    Circle()
                        .fill(self.currentIndex % productViewModel.productItems[index].image.count == index ? Color(.orange) : Color(.gray))
                        .frame(width: 10, height: 10)
                }
                Spacer()
            }
            .padding()
            .offset(y: -20) // Adjust the vertical position as needed
        }
        .onAppear {
            productViewModel.fetchData()
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                self.currentIndex += 1
                if self.currentIndex >= limit {
                    self.currentIndex = 0
                }
            }
        }
    }
}

//
//struct ImageSliderView: View {
//        @StateObject private var productViewModel = ProductViewModel()
//        @State private var currentIndex = 0
//
//    var body: some View {
//        ZStack(alignment: .bottomLeading) {
//            ZStack(alignment: .trailing) {
//                if !productViewModel.productItems.isEmpty {
//                    Image(productViewModel.productItems[currentIndex].image[0]) // Use the first image of the current product
//                        .resizable()
//                        .frame(width: .infinity, height: 180)
//                        .scaledToFit()
//                        .cornerRadius(15)
//                } else {
//                    // Placeholder or loading indicator when no images are available
//                    Text("Loading...")
//                }
//            }
//            // Page indicators
//            HStack {
//                ForEach(0..<productViewModel.productItems.count, id: \.self) { index in
//                    Circle()
//                        .fill(self.currentIndex == index ? Color(.blue) : Color(.blue))
//                        .frame(width: 10, height: 10)
//                }
//            }
//            .padding()
//        }
//        .padding()
//        .onAppear {
//            // Fetch product data when view appears
//            productViewModel.fetchData()
//
//            // Timer for automatic sliding
//            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
//                if self.currentIndex + 1 == self.productViewModel.productItems.count {
//                    self.currentIndex = 0
//                } else {
//                    self.currentIndex += 1
//                }
//            }
//        }
//    }
//}
//
