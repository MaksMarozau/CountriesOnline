//
//  TextFieldCustomeView.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

struct TextFieldCustomeView: View {
    
    @State var text: String = ""
    @StateObject var viewModel: CountriesViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.keyWords = ""
                text = ""
            }) {
                Image(systemName: "eraser.line.dashed")
                    .frame(width: 45, height: 45)
                    .background(.blue)
                    .foregroundColor(.white)
            }
            
            TextField("Search...", text: $viewModel.keyWords)
                .frame(height: 45)
                .foregroundStyle(.black)
            
            Button(action: {
                print("Favorites tapped")
            }) {
                Image(systemName: "star.fill")
                    .frame(width: 45, height: 45)
                    .background(.blue)
                    .foregroundColor(.yellow)
            }
                
        }
        .overlay(content: {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 2)
            
        })
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
    }
}

#Preview {
    let viewModel = CountriesViewModel()
    TextFieldCustomeView(viewModel: viewModel)
}
