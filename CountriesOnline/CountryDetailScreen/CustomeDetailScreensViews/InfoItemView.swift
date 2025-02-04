//
//  InfoItemView.swift
//  CountriesOnline
//
//  Created by Maks on 31.01.25.
//

import SwiftUI


struct InfoItemView: View {
    
    //MARK: - Properties
    @State var title: String
    @State var description: String
    
    //MARK: - Body of main view
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 19, weight: .semibold))
                    .padding(.leading, 21)
                
                Text(description)
                    .font(.system(size: 19, weight: .semibold))
                
                
                Spacer()
            }
            
            Color(.separator)
                .frame(height: 1)
                .padding(.horizontal, 22)
        }
        .padding(.bottom, 12)
    }
}


#Preview {
    let title = "Capital:"
    let description = "Minsk"
    InfoItemView(title: title, description: description)
}
