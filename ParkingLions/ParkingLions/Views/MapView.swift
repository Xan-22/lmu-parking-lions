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
    @EnvironmentObject var mapSettings: MapSettings
    @StateObject private var mapModel = MapViewModel()
    @Binding var parkingAreaData: ParkingAreaData
    let mapViewController = MapViewController()
    @State private var counter = 0

    func makeUIView(context: Context) -> MKMapView {
        mapModel.startLocationService()
        
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.region = MapDetails.defaultRegion
        mapView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: elevationStyle(), emphasisStyle: emphasisStyle())
        mapView.showsUserLocation = true
        addMapInfo(mapView)
        return mapView
    }
    
    func addMapInfo(_ mapView: MKMapView) {
        mapView.addOverlays(MapInfo.allOverlays)
        mapView.addAnnotations(MapInfo.allAnnotations)
    }
    
    func makeCoordinator() -> Coordinator {
      Coordinator(self)
    }
     
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.delegate = (mapViewController as MKMapViewDelegate)
        uiView.showsUserLocation = true
        updateMapType(uiView)
    }
     
    private func updateMapType(_ uiView: MKMapView) {
        switch mapSettings.mapType {
        case 0:
            uiView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: elevationStyle(), emphasisStyle: emphasisStyle())
            let mapConfig = MKStandardMapConfiguration(elevationStyle: elevationStyle(), emphasisStyle: emphasisStyle())
                        mapConfig.pointOfInterestFilter = MKPointOfInterestFilter(including: [])
                        uiView.preferredConfiguration = mapConfig
            uiView.preferredConfiguration = mapConfig
        case 1:
            uiView.preferredConfiguration = MKHybridMapConfiguration(elevationStyle: elevationStyle())
            let mapConfig = MKHybridMapConfiguration(elevationStyle: elevationStyle())
                        mapConfig.pointOfInterestFilter = MKPointOfInterestFilter(including: [])
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

class Coordinator: NSObject, MKMapViewDelegate {
  var parent: MapView

  init(_ parent: MapView) {
    self.parent = parent
  }
}


struct MapView_Previews: PreviewProvider {
    static var mapSettings = MapSettings()
    @State static var parkingAreaData = ParkingAreaData()
    @State static var isActive = false
    static var previews: some View {
        MapView(parkingAreaData: $parkingAreaData)
        .edgesIgnoringSafeArea(.all).environmentObject(mapSettings)
    }
}
