//
//  CountriesView.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

struct CountriesView: View {
    @State var text: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("Поиск нажат")
                }) {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 36, height: 36)
                        .background(.blue)
                        .foregroundColor(.white)
                }
                
                TextField("Search", text: $text)
                    .padding(.trailing, 10)
                    .frame(height: 36)
                    .foregroundStyle(.black)
                    
            }
            .overlay(content: {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 2)
                
            })
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
            
            
            List {
                Text("Hello, World!")
            }
        }
    }
}

#Preview {
    CountriesView()
}
