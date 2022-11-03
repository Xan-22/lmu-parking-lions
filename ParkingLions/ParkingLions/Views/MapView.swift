//
//  MapView.swift
//  ParkingLions
//
//  Created by Xan on 10/24/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var mapModel = MapViewModel()
    
    var body: some View {
        Map(coordinateRegion: $mapModel.region, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .ignoresSafeArea()
            .onAppear {
                mapModel.startLocationService()
            }
        // TODO: Start annotating map with parking area markers
        // TODO: Maybe lock the map to the area surrounding LMU?
        // TODO: Maybe remove all existing map annotations and replace what we want with our own?
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
