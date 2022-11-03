//
//  ContentView.swift
//  RegoinMonitor
//
//  Created by Sachinthana Aluvihare on 11/12/21.
//



import SwiftUI
import MapKit


struct MapView: View {
//    @EnvironmentObject var settings: AlertSettings
    @StateObject private var viewModel = MapViewModel()
    @EnvironmentObject var settings: AlertSettings
    var body: some View {
        HStack{
            Text("User at destination: \(settings.showAlert ? "Yes" : "No")")
        }
        HStack{
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPink))
                .onAppear{
                    viewModel.checkIfLocationServicesIsEnabled()
                }
        }
    }
    struct MapView_Previews: PreviewProvider{
        static var previews: some View {
                    MapView()
        }
    }
    
    final class MapViewModel: NSObject, ObservableObject,CLLocationManagerDelegate {
        var locationManager : CLLocationManager?
        
        @Published var region = MKCoordinateRegion (center:CLLocationCoordinate2D (latitude : 37.331516, longitude : -121.891054),span:MKCoordinateSpan(latitudeDelta : 0.05,longitudeDelta : 0.05))
        
        func checkIfLocationServicesIsEnabled(){
            if CLLocationManager.locationServicesEnabled() {
                locationManager = CLLocationManager ()
                locationManager!.delegate = self
            } else {
                print("Show an alert letting them know this is off and to go turn it on. ")
            }
        }
        
        private func checkLocationAuthorization () {
            guard let locationManager = locationManager else { return }
            switch locationManager.authorizationStatus{
                
            case .notDetermined:
                locationManager.requestAlwaysAuthorization()
            case .restricted:
                print ("Your location is restricted likely due to parental controls. ")
            case .denied:
                print("You have denied this app location permission . Go into settings to change it. ")
            case .authorizedAlways, .authorizedWhenInUse:
                region = MKCoordinateRegion (center:CLLocationCoordinate2D (latitude : 37.331516, longitude : -121.891054),span: MKCoordinateSpan (latitudeDelta: 0.05, longitudeDelta : 0.05))
            @unknown default:
                break
            }
            
        }
        
        func locationManagerDidChangeAuthorization (_ manager:CLLocationManager) {
            checkLocationAuthorization ()
        }
    }
}
