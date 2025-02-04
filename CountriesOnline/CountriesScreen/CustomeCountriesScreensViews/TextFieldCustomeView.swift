//
//  TextFieldCustomeView.swift
//  CountriesOnline
//
//  Created by Maks on 29.01.25.
//

import SwiftUI

//MARK: Custome TextFieldView with the buttons
struct TextFieldCustomeView: View {
    
    //MARK: - Properties
    @State var text: String = ""
    @StateObject var viewModel: CountriesViewModel
    
    //MARK: - Body of main view
    var body: some View {
        HStack {
            
            //Button to clear any inputed text
            Button(action: {
                viewModel.keyWords = ""
                text = ""
            }) {
                Image(systemName: "eraser.line.dashed")
                    .frame(width: 45, height: 45)
                    .background(.blue)
                    .foregroundColor(.white)
            }
            
            //TextField body
            TextField("Search...", text: $viewModel.keyWords)
                .frame(height: 45)
                .foregroundStyle(.customeBlack)
            
            //Button to open the Favorite countries page
            NavigationLink(destination: {
                FavoriteCountriesView(countriesArray: viewModel.countriesToShowArray)
            }, label: {
                Image(systemName: "star.fill")
                    .frame(width: 45, height: 45)
                    .background(.blue)
                    .foregroundColor(.yellow)
            })
        }
        
        //Additional designer setup
        .overlay(content: {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.customeBlack, lineWidth: 2)
            
        })
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
    }
}


#Preview {
    let viewModel = CountriesViewModel()
    TextFieldCustomeView(viewModel: viewModel)
}
