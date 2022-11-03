//
//  MapViewModel.swift
//  ParkingLions
//
//  Created by Xan on 11/2/22.
//

import Foundation
import CoreLocation
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 33.9700, longitude: -118.4179)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    func startLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self // TODO: Remove this force unwrap if possible
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Error: Location services are disabled. Please enable them to properly use this app.")
            // TODO: Pop-up instead
        }
    }
    
    func checkLocationAuth() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            print("Error: Your location is restricted!")
            // TODO: Pop-up instead
        case .denied:
            print("Error: Please allow this app location permissions in your settings.")
            // TODO: Pop-up instead
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MapDetails.defaultSpan)
            // TODO: Remove this forced unwrap if possible
        @unknown default:
            break
        }

        func locationAuthChanged(_ manager: CLLocationManager) {
            checkLocationAuth()
        }
    }
}