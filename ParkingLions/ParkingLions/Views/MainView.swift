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
    @EnvironmentObject var settings: AlertSettings
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
                            .padding(10)
                    }
                }
            }.overlay(alignment: .center){
                if settings.showAlert {
                    QuestionView()
                        .environmentObject(service)
                        .environmentObject(settings)
                        .frame(width: 350, height: 160)
                }
                
            }.ignoresSafeArea()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    @ObservedObject static var settings = AlertSettings()
    static var previews: some View {
        MainView()
            .environmentObject(ParkingLionsAreaService())
            .environmentObject(settings)
            .onAppear {
                settings.showAlert = true
            }
    }
}
