//
//  MapViewCoordinator.swift
//  ParkingLions
//
//  Created by Xan on 11/25/22.
//  Help from https://medium.com/@nimjea/mapkit-in-swiftui-c0cc2b07c28a

import SwiftUI
import MapKit
import Combine

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    var mapViewController: MapView
        
    init(_ control: MapView) {
        self.mapViewController = control
    }
        
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
        if overlay is MKCircle {
            let renderer = MKCircleRenderer(overlay: overlay)
            renderer.fillColor = UIColor.blue.withAlphaComponent(0.5)
            renderer.strokeColor = UIColor.white
            renderer.lineWidth = 2
            return renderer
        
        } else if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 3
            return renderer
        
        } else if overlay is MKPolygon {
            let renderer = MKPolygonRenderer(polygon: overlay as! MKPolygon)
            renderer.fillColor = UIColor.blue.withAlphaComponent(0.5)
            renderer.strokeColor = UIColor.white
            renderer.lineWidth = 2
            return renderer
        }
        
        return MKOverlayRenderer()
    }
}
