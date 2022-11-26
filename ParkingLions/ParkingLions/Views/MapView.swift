//
//  MapView.swift
//  ParkingLions
//
//  Created by Xan on 10/24/22.
//
// Help from https://holyswift.app/new-mapkit-configurations-with-swiftui/
// and https://www.appcoda.com/mapkit-polyline-polygon/

import SwiftUI
import MapKit
import Combine

struct MapView: UIViewRepresentable {
    @StateObject private var mapModel = MapViewModel()
    @EnvironmentObject private var mapSettings: MapSettings

    private var counter = 0
    let lmuLogo = LMUAnnotation()
    
    func makeCoordinator() -> MapViewCoordinator {
         MapViewCoordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {
        mapModel.startLocationService()
        
        let mapView = MKMapView(frame: .zero)
        mapView.region = mapModel.region
        mapView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: elevationStyle(), emphasisStyle: emphasisStyle())
        mapView.showsUserLocation = true
        
        mapView.delegate = context.coordinator
        mapView.addAnnotation(lmuLogo)
        return mapView
    }
     
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateMapType(uiView)
        addOverlaysAndAnnotations(uiView)
    }
    
    private func addOverlaysAndAnnotations(_ uiView: MKMapView) {
        uiView.addAnnotation(lmuLogo)
        var polygons: [MKPolygon] = []
        for area in parkingAreas {
            var locations = area.boundaryCoordinates
            polygons.append(MKPolygon(coordinates: &locations, count: locations.count))
        }
        uiView.addOverlays(polygons)
    }
     
    private func updateMapType(_ uiView: MKMapView) {
        switch mapSettings.mapType {
        case 0:
            uiView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: elevationStyle(), emphasisStyle: emphasisStyle())
            let mapConfig = MKStandardMapConfiguration(elevationStyle: elevationStyle(), emphasisStyle: emphasisStyle())
                        mapConfig.pointOfInterestFilter = MKPointOfInterestFilter(including: [.parking])
                        uiView.preferredConfiguration = mapConfig
            uiView.preferredConfiguration = mapConfig
        case 1:
            uiView.preferredConfiguration = MKHybridMapConfiguration(elevationStyle: elevationStyle())
            let mapConfig = MKHybridMapConfiguration(elevationStyle: elevationStyle())
                        mapConfig.pointOfInterestFilter = MKPointOfInterestFilter(including: [.parking])
                        uiView.preferredConfiguration = mapConfig
            uiView.preferredConfiguration = mapConfig
        default:
            break
        }
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
        MapView()
        .edgesIgnoringSafeArea(.all).environmentObject(mapSettings)
    }
}
