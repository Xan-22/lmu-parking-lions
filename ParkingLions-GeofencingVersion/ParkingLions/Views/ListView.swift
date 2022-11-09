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
        List {
            NavigationLink {
                SettingsView().environmentObject(mapSettings)
            } label: {
                HStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
        }
        //List {
            // TODO: List all parking areas here
        //}
    }
}

struct ListView_Previews: PreviewProvider {
    @ObservedObject static var mapSettings = MapSettings()
    static var previews: some View {
        ListView().environmentObject(mapSettings)
    }
}
