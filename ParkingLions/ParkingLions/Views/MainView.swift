//
//  MainView.swift
//  ParkingLions
//
//  Created by Xan on 11/6/22.
//  Help from https://stackoverflow.com/a/59164100

import SwiftUI
import MapKit

struct MainView: View {
    @EnvironmentObject var service: ParkingLionsAreaService
    @ObservedObject var mapSettings = MapSettings()
    @StateObject private var mapModel = MapViewModel()
    @State var parkingAreaData = ParkingAreaData()
    
    var body: some View {
        NavigationView {
            ZStack {
                MapView(parkingAreaData: $parkingAreaData)
                    .edgesIgnoringSafeArea(.all).environmentObject(mapSettings)
                    .navigationBarTitle("Map")
                    .toolbar(.hidden)
                ZStack(alignment: .bottomTrailing) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    NavigationLink {
                        ListView(parkingAreaData: $parkingAreaData)
                            .environmentObject(mapSettings)
                            .environmentObject(service)
                    } label: {
                        FloatingButton(imageName: "line.3.horizontal")
                            .frame(width: 100, height: 100)
                            .padding(.horizontal, 10)
                    }
                }.onAppear {
                    mapModel.startLocationService()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ParkingLionsAreaService())
    }
}
