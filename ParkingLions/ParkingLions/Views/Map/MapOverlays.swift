//
//  MapAnnotations.swift
//  ParkingLions
//
//  Created by Xan on 11/8/22.
//

import SwiftUI
import CoreLocation
import MapKit

class LMUAnnotation: NSObject, MKAnnotation {
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate = MapDetails.logoPosition
    
    var title: String? = NSLocalizedString("LMU", comment: "LMU Annotation")
    var subtitle: String? = NSLocalizedString("LMU", comment: "LMU Annotation")
}

class LMUAnnotationView: MKAnnotationView {
    var body: some View {
        Image("LMULogo")
            .frame(width: 100, height: 100)
    }
}


