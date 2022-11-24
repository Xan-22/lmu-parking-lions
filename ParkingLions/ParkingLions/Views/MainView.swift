//
//  MainView.swift
//  ParkingLions
//
//  Created by Xan on 11/6/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mapSettings = MapSettings()
        
    var body: some View {
        NavigationView {
            ZStack {
                if #available(iOS 16.0, *) {
                    AdvMapView()
                        .edgesIgnoringSafeArea(.all).environmentObject(mapSettings)
                        .navigationBarTitle("Map")
                        .toolbar(.hidden)
                } else {
                    BasicMapView()
                        .navigationBarTitle("Map")
                        .navigationBarHidden(true)
                }
                ZStack(alignment: .bottomTrailing) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    NavigationLink {
                        ListView()
                            .environmentObject(mapSettings)
                    } label: {
                        FloatingButton(imageName: "line.3.horizontal")
                            .frame(width: 100, height: 100)
                            .padding(.horizontal, 10)
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
