//
//  MapAnnotations.swift
//  ParkingLions
//
//  Created by Xan on 11/8/22.
//

import SwiftUI
import CoreLocation
import MapKit

enum MapOverlays {
    static let drollinger =  MKPolygon(coordinates: [
        
        CLLocationCoordinate2D(latitude: 33.969747814141556, longitude: -118.41911572749991),
        CLLocationCoordinate2D(latitude: 33.969747814141556, longitude: -118.41880395034723),
        CLLocationCoordinate2D(latitude: 33.96840694911493, longitude: -118.41880395034723),
        CLLocationCoordinate2D(latitude: 33.96840694911493, longitude: -118.42048557760448),
        CLLocationCoordinate2D(latitude: 33.96862443243661, longitude: -118.42048557760448)
    ], count: 5)

}


