//
//  ListView.swift
//  ParkingLions
//
//  Created by Xan on 11/6/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var mapSettings: MapSettings
    var body: some View {
        VStack {
            ZStack {
                NavigationLink {
                    SettingsView().environmentObject(mapSettings)
                } label: {
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
            }
            List(parkingAreas, id: \.id) { area in
                NavigationLink {
                    AreaDetail(parkingArea: area)
                } label: {
                    ListRow(parkingArea: area)
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    @ObservedObject static var mapSettings = MapSettings()
    static var previews: some View {
        ListView().environmentObject(mapSettings)
    }
}
