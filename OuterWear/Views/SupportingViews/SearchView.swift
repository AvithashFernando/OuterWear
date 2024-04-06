//
//  SearchView.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC07 on 2024-03-31.
//

import SwiftUI

struct SearchView: View {
    @State private var Search: String = ""

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)

                TextField("Search For your Style", text: $Search)
                    .padding()
            }
            .background(Color(Color.gray.opacity(0.2)))
            .cornerRadius(12)

            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color(.orange))
                .cornerRadius(12)
        }
            .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

