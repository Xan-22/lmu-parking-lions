//
//  AdvMapView.swift
//  ParkingLions
//
//  Created by Xan on 10/24/22.
//
// Help from https://holyswift.app/new-mapkit-configurations-with-swiftui/
// TODO: Track Current Location
// TODO: Highlight and annotate parking areas

import SwiftUI
import MapKit
import Combine

@available(iOS 16.0, *)
struct AdvMapView: UIViewRepresentable {
    @StateObject private var mapModel = MapViewModel()
    private var counter = 0
    @EnvironmentObject private var mapSettings: MapSettings
    
    func makeUIView(context: Context) -> MKMapView {
        mapModel.startLocationService()
        
        let mapView = MKMapView(frame: .zero)
        mapView.region = mapModel.region
        let mapConfig = MKStandardMapConfiguration(elevationStyle: elevationStyle(), emphasisStyle: emphasisStyle())
        mapView.preferredConfiguration = mapConfig
        mapView.showsUserLocation = true
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateMapType(uiView)
        uiView.delegate = context.coordinator
        uiView.addAnnotation(LMUAnnotation())
    }
    
    private func updateMapType(_ uiView: MKMapView) {
        switch mapSettings.mapType {
        case 0:
            let mapConfig = MKStandardMapConfiguration(elevationStyle: elevationStyle(), emphasisStyle: emphasisStyle())
            mapConfig.pointOfInterestFilter = MKPointOfInterestFilter(including: [.parking])
            uiView.preferredConfiguration = mapConfig
        case 1:
            let mapConfig = MKHybridMapConfiguration(elevationStyle: elevationStyle())
            mapConfig.pointOfInterestFilter = MKPointOfInterestFilter(including: [.parking])
            uiView.preferredConfiguration = mapConfig
        default:
            break
        }
    }
    
    func makeCoordinator() -> AdvMapViewCoordinator{
         AdvMapViewCoordinator(self)
    }
    
    private func elevationStyle() -> MKMapConfiguration.ElevationStyle {
        if mapSettings.showElevation == 0 {
            return MKMapConfiguration.ElevationStyle.realistic
        } else {
            return MKMapConfiguration.ElevationStyle.flat
        }
    }
    
    private func emphasisStyle() -> MKStandardMapConfiguration.EmphasisStyle {
        if mapSettings.showEmphasis == 0 {
            return MKStandardMapConfiguration.EmphasisStyle.default
        } else {
            return MKStandardMapConfiguration.EmphasisStyle.muted
        }
    }

}
    
struct MapView_Previews: PreviewProvider {
    static var mapSettings = MapSettings()
    static var previews: some View {
        if #available(iOS 16.0, *) {
            AdvMapView()
                .edgesIgnoringSafeArea(.all).environmentObject(mapSettings)
        } else {
            Text("Error: Wrong iOS Version for Advanced Map.")
        }
    }
}
