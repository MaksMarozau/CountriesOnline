//
//  FooterButtonsView.swift
//  CountriesOnline
//
//  Created by Maks on 1.02.25.
//

import SwiftUI

struct FooterButtonsView: View {
    
    @State private var isFavorite: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                Color(.customeGray)
                    .frame(width: 70, height: 55)
                    .cornerRadius(10)
                    .shadow(color: .customeGray, radius: 12, y: 5)
                
                Button {
                    isFavorite.toggle()
                } label: {
                    ZStack {
                        Color(.white)
                            .frame(width: 70, height: 47)
                            .cornerRadius(10)
                            .padding(.bottom, 9)
                        
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                            .padding(.bottom, 8)
                    }
                }
            }
            
            Spacer()
            
            ZStack {
                Color(.customeGray)
                    .frame(width: 70, height: 55)
                    .cornerRadius(10)
                    .shadow(color: .customeGray, radius: 12, y: 5)
                
                Button {
                    
                } label: {
                    ZStack {
                        Color(.white)
                            .frame(width: 70, height: 47)
                            .cornerRadius(10)
                            .padding(.bottom, 9)
                        
                        Image(systemName: "map")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .padding(.bottom, 8)
                    }
                }
            }
            
            Spacer()
            
            ZStack {
                Color(.customeGray)
                    .frame(width: 70, height: 55)
                    .cornerRadius(10)
                    .shadow(color: .customeGray, radius: 12, y: 5)
                
                Button {
                    
                } label: {
                    ZStack {
                        Color(.white)
                            .frame(width: 70, height: 47)
                            .cornerRadius(10)
                            .padding(.bottom, 9)
                        
                        Image(systemName: "shared.with.you")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                            .padding(.bottom, 8)
                    }
                }
            }
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    FooterButtonsView()
}
