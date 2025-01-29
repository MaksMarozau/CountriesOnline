//
//  TextFieldCustomeView.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

struct TextFieldCustomeView: View {
    
    @State var text: String = ""
    
    var body: some View {
        HStack {
            Button(action: {
                print("Поиск нажат")
            }) {
                Image(systemName: "magnifyingglass")
                    .frame(width: 45, height: 45)
                    .background(.blue)
                    .foregroundColor(.white)
            }
            
            TextField("Search...", text: $text)
                .padding(.trailing, 10)
                .frame(height: 45)
                .foregroundStyle(.black)
                
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
    TextFieldCustomeView()
}
