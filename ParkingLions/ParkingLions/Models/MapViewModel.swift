//
//  MapViewModel.swift
//  ParkingLions
//
//  Created by Xan on 11/2/22.
//

import Foundation
import CoreLocation
import MapKit

final class MapSettings: ObservableObject {
    @Published var mapType = 0
    @Published var showElevation = 0
    @Published var showEmphasis = 0
    @Published var basicMap = false
}

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 33.9700, longitude: -118.4179)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    func startLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            // TODO: fix this warning here ^
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

// Extension from https://stackoverflow.com/a/66052227
extension MKMapView {
    func removeAnnotationAndOverlay(annotation: MKAnnotation) {
        removeAnnotation(annotation)
        if overlays.count > 0 {
            if let overlay = overlays.first {
                removeOverlay(overlay)
            }
        }
    }
        
    func removeAllOverlays() {
        removeOverlays(overlays)
    }
        
        
    func removeAllAnnotations() {
        removeAnnotations(annotations)
    }
    
    func removeAllAnnotationsAndOverlays() {
        removeAllOverlays()
        removeAllAnnotations()
    }
}
