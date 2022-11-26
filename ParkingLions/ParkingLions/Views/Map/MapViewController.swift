//
//  MapViewCoordinator.swift
//  ParkingLions
//
//  Created by Xan on 11/25/22.
//  Help from https://medium.com/@nimjea/mapkit-in-swiftui-c0cc2b07c28a

import SwiftUI
import MapKit
import Combine

class MapViewController: UIViewController, MKMapViewDelegate {
    
    //    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    //        if annotation is LMUAnnotation {
    //            return LMUAnnotationView()
    //        }
    //
    //        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
    //        annotationView.canShowCallout = true
    //        annotationView.image = UIImage(named: "locationPin")
    //        return annotationView
    //    }
    //
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if overlay is MKPolygon {
                let renderer = MKPolygonRenderer(polygon: overlay as! MKPolygon)
                renderer.fillColor = UIColor.blue.withAlphaComponent(0.6)
                renderer.strokeColor = UIColor.white
                renderer.lineWidth = 8
                return renderer
            }
            
            return MKOverlayRenderer()
        }
}
