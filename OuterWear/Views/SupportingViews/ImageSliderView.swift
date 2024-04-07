//
//  ImageSliderView.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC07 on 2024-03-31.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    var slides: [String] = ["Deal1","Deal2","Deal3"]

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .trailing) {
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: .infinity, height: 180)
                    .scaledToFit()
                    .cornerRadius(15)
            }
            HStack {
                ForEach(0..<slides.count) { index in
                    Circle()
                        .fill(self.currentIndex == index ? Color(.orange) : Color(.white))
                        .frame(width: 10, height: 10)
                }
            }
            .padding()
        }
        .padding()
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) {timer in
                if self.currentIndex + 1 == self.slides.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
        }
    }
}

struct ImageSliderView_preview: PreviewProvider {
    static var previews: some View {
        ImageSliderView()
    }
}

