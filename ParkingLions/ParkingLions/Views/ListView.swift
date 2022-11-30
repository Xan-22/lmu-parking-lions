//
//  ListView.swift
//  ParkingLions
//
//  Created by Xan on 11/6/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var mapSettings: MapSettings
    @EnvironmentObject var parkingService: ParkingLionsAreaService
    @Binding var parkingAreaData: ParkingAreaData
    @State var fetching = false
    @State var error: Error?
    
    func refresh() async {
        fetching = true
        do {
            let data = try await parkingService.fetchAreas()
            parkingAreaData.updateData(data)
            fetching = false
        } catch {
            self.error = error
            fetching = false
        }
    }
    
    var body: some View {
        VStack {
            if fetching {
                ProgressView()
            } else if error != nil {
                VStack {
                    Spacer()
                    Text("Unknown Error:\nTry refreshing the page.")
                    Spacer()
                }
            } else if parkingAreaData.parkingAreas.count == 0 {
                VStack {
                    Spacer()
                    Text("Error:\nNo data retrieved! Try refreshing the page.")
                    Spacer()
                }
            }  else {
                List(parkingAreaData.parkingAreas, id: \.id) { area in
//                    NavigationLink {
//                        AreaDetail(name: area.name, busyness: area.busyness)
//                    } label: {
//                        ListRow(name: area.name, busyness: area.busyness)
//                    }
                    ListRow(name: area.name, lot: area.lot, busyness: area.busyness)
                }.refreshable {
                    await refresh()
                }
            }
        }.toolbar {
            ToolbarItem(placement: .primaryAction) {
                NavigationLink {
                    SettingsView().environmentObject(mapSettings)
                } label: {
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
            }
        }.task {
            await refresh()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    @ObservedObject static var mapSettings = MapSettings()
    @State static var parkingAreaData = ParkingAreaData()
    static var previews: some View {
        ListView(parkingAreaData: $parkingAreaData)
            .environmentObject(MapSettings())
            .environmentObject(ParkingLionsAreaService())
    }
}
