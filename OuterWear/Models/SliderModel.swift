//
//  Slider.swift
//  OuterWear
//
//  Created by NIBMPC04PC03 on 2024-04-07.
//

import Foundation

struct Slide : Identifiable {
    var id = UUID()
    var image = String()
    
}

var sliderList = [
    Slide(
        image: "Deal1"
    ),
    Slide(
        image: "Deal2"
    ),
    Slide(
        image: "Deal3"
    )
]
