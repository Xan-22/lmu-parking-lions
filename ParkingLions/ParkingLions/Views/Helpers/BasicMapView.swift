//
//  BasicMapView.swift
//  ParkingLions
//
//  Created by Xan on 11/6/22.
//

import SwiftUI
import MapKit

struct BasicMapView: View {
    @StateObject private var mapModel = MapViewModel()
    var body: some View {
        Map(coordinateRegion: $mapModel.region, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .ignoresSafeArea()
            .onAppear {
                mapModel.startLocationService()
            }
    // TODO: Somehow make this map look nice with our own annotations
    }
}

struct BasicMapView_Previews: PreviewProvider {
    static var previews: some View {
        BasicMapView()
    }
}
