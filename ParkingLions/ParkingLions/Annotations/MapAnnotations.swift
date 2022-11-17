//
//  MapAnnotations.swift
//  ParkingLions
//
//  Created by Xan on 11/8/22.
//

import SwiftUI
import CoreLocation
import MapKit

@available(iOS 16.0, *)
class LMUAnnotation: NSObject, MKAnnotation {
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate = MapDetails.logoPosition
    
    // Required if you set the annotation view's `canShowCallout` property to `true`
    var title: String? = NSLocalizedString("LMU", comment: "LMU Annotation")
    
    // This property defined by `MKAnnotation` is not required.
    var subtitle: String? = NSLocalizedString("LMU", comment: "LMU Annotation")
}

class LMUAnnotationView: MKAnnotationView {
  var body: some View {
      Image("locationPin")
  }
}

