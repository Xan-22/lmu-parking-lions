//
//  MapViewCoordinator.swift
//  ParkingLions
//
//  Created by Xan on 11/25/22.
//  Help from https://medium.com/@nimjea/mapkit-in-swiftui-c0cc2b07c28a
//  and https://stackoverflow.com/a/61564206

import SwiftUI
import MapKit
import Combine

class MapViewController: UIViewController, MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Parking")
        if annotationView == nil {
            annotationView = ParkingAnnotationView(annotation: annotation, reuseIdentifier: "Parking")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolygon {
            let renderer = MKPolygonRenderer(polygon: overlay as! MKPolygon)
            renderer.fillColor = UIColor.blue.withAlphaComponent(0.6)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 3
            return renderer
        }
        return MKOverlayRenderer()
    }
}

class ParkingAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D) {
            self.title = title
            self.subtitle = subtitle
            self.coordinate = coordinate
    }
}

class ParkingAnnotationView: MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        configureImage()
        configureView()
        configureAnnotationView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage() {
        let radius: CGFloat = 18
        let center = CGPoint(x: radius, y: radius)
        let rect = CGRect(origin: .zero, size: CGSize(width: 36, height: 45))
        let angle: CGFloat = .pi / 16

        let image = UIGraphicsImageRenderer(bounds: rect).image { _ in UIColor.white.setFill()
            let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: .pi / 2 - angle, endAngle: .pi / 2 + angle, clockwise: false)
                path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
                path.close()
                path.fill()

            let configuration = UIImage.SymbolConfiguration(pointSize: 24)
            let icon = UIImage(systemName: "parkingsign.circle", withConfiguration: configuration)!
                .withTintColor(.blue)
            icon.draw(at: CGPoint(x: center.x - icon.size.width / 2, y: center.y - icon.size.height / 2))
        }

        self.image = image
        centerOffset = CGPoint(x: 0, y: -image.size.height / 2)
    }

    func configureView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.5
    }

    func configureAnnotationView() {
        canShowCallout = true
    }
}


