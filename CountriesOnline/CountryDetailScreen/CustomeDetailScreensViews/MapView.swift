//
//  MapView.swift
//  CountriesOnline
//
//  Created by Maks on 3.02.25.
//

import SwiftUI
import  MapKit

struct MapView: View {
    var coordinates: CLLocationCoordinate2D
    var countryName: String
    
    @State private var position: MapCameraPosition = .automatic
    @StateObject var viewModel: CountryDetailViewModel

    var body: some View {
        ZStack {
            Map(position: $position) {
                Marker(countryName, systemImage: "mappin", coordinate: coordinates)
            }
            .onAppear {
                let region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: coordinates.latitude,
                        longitude: coordinates.longitude),
                    span: MKCoordinateSpan(
                        latitudeDelta: 2,
                        longitudeDelta: 2)
                )
                position = .region(region)
            }
            
            VStack {
                Spacer()
                
                Button {
                    viewModel.mapButtonTapped()
                } label: {
                    ZStack {
                        Color(.customeGray)
                            .frame(width: 250, height: 55)
                            .cornerRadius(10)
                            .shadow(color: .customeGray, radius: 15, y: 10)
                        
                        Color(.white)
                            .frame(width: 250, height: 45)
                            .cornerRadius(10)
                            .padding(.bottom, 9)
                        
                        Text("Close")
                            .font(.system(size: 21, weight: .bold))
                            .padding(.bottom, 9)
                        
                    }
                    .padding(.bottom, 50)
                }
            }
        }
    }
}

#Preview {
    MapView(coordinates: CLLocationCoordinate2D(latitude: 51.811, longitude: 33.4573), countryName: "Butan", viewModel: CountryDetailViewModel())
}
