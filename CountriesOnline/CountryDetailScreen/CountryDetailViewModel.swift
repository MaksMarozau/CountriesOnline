//
//  CountryDetailViewModel.swift
//  CountriesOnline
//
//  Created by Maks on 1.02.25.
//

import MapKit


final class CountryDetailViewModel: ObservableObject {
    
    func openMapWithCoordinates(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Место назначения"
        mapItem.openInMaps()
    }
}
