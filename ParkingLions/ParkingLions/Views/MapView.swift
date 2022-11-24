//
//  MapView.swift
//  ParkingLions
//
//  Created by Xan on 10/24/22.
//
// Help from https://holyswift.app/new-mapkit-configurations-with-swiftui/
// and https://github.com/egesucu/WWDC22MapKit
// TODO: Track Current Location
// TODO: Highlight and annotate parking areas

import SwiftUI
import MapKit
import Combine

@available(iOS 16.0, *)
struct MapView: UIViewRepresentable {
    @StateObject private var mapModel = MapViewModel()
    private var counter = 0
    @EnvironmentObject private var mapSettings: MapSettings

    func makeUIView(context: Context) -> MKMapView {
        mapModel.startLocationService()
        
        let mapView = MKMapView(frame: .zero)
        mapView.region = mapModel.region
        mapView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: elevationStyle(), emphasisStyle: emphasisStyle())
        mapView.showsUserLocation = true
        return mapView
    }
    
    func configureMapArea(_ uiView: MKMapView){
            let region = MKCoordinateRegion(center: .init(latitude: 39.925533, longitude: 32.866287), span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05))
            uiView.setRegion(region, animated: true)
            uiView.isZoomEnabled = true
            
    }
     
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateMapType(uiView)
    }
     
    private func updateMapType(_ uiView: MKMapView) {
        switch mapSettings.mapType {
        case 0:
            uiView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: elevationStyle(), emphasisStyle: emphasisStyle())
        case 1:
            uiView.preferredConfiguration = MKHybridMapConfiguration(elevationStyle: elevationStyle())
        case 2:
            uiView.preferredConfiguration = MKImageryMapConfiguration(elevationStyle: elevationStyle())
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
        if #available(iOS 16.0, *) {
            MapView()
                .edgesIgnoringSafeArea(.all).environmentObject(mapSettings)
        } else {
            Text("Error: Wrong iOS Version for Advanced Map.")
        }
    }
}
