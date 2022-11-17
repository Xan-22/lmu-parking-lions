//
//  AdvMapViewCoordinator.swift
//  ParkingLions
//
//  Created by Xan on 11/8/22.
//
// Help from https://medium.com/@nimjea/mapkit-in-swiftui-c0cc2b07c28a

import SwiftUI
import MapKit
import Combine

@available(iOS 16.0, *)
class AdvMapViewCoordinator: NSObject, MKMapViewDelegate {
    var mapViewController: AdvMapView
        
    init(_ control: AdvMapView) {
        self.mapViewController = control
    }
        
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //Custom View for Annotation
        if annotation is LMUAnnotation {
            return LMUAnnotationView()
        }
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
        annotationView.canShowCallout = true
        //Your custom image icon
        annotationView.image = UIImage(named: "locationPin")
        return annotationView
    }
}
