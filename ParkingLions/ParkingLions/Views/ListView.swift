//
//  ListView.swift
//  ParkingLions
//
//  Created by Xan on 11/6/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var mapSettings: MapSettings
    @Binding var parkingAreaData: ParkingAreaData
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
            List(parkingAreaData.parkingAreas, id: \.id) { area in
                NavigationLink {
                    AreaDetail(name: area.name, busyness: area.busyness)
                } label: {
                    ListRow(name: area.name, busyness: area.busyness)
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    @ObservedObject static var mapSettings = MapSettings()
    @State static var parkingAreaData = ParkingAreaData()
    static var previews: some View {
        ListView(parkingAreaData: $parkingAreaData).environmentObject(mapSettings)
    }
}
