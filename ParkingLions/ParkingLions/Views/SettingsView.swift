//
//  SettingsView.swift
//  ParkingLions
//
//  Created by Xan on 11/6/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var mapSettings: MapSettings
    @State var mapType = 0
    @State var showElevation = 0
    @State var showEmphasis = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Map Settings")) {
                    VStack(alignment: .leading) {
                        
                        Picker("Map Type", selection: $mapType) {
                            Text("Standard").tag(0)
                            Text("Hybrid").tag(1)
                            Text("Image").tag(2)
                        }.pickerStyle(MenuPickerStyle())
                            .onChange(of: mapType) { newValue in
                                mapSettings.mapType = newValue
                            }.padding([.top, .leading, .trailing], 16)
                        
                        Divider()
                        
                        Picker("Map Elevation", selection: $showElevation) {
                            Text("Realistic").tag(0)
                            Text("Flat").tag(1)
                        }.pickerStyle(MenuPickerStyle())
                            .onChange(of: showElevation) { newValue in
                                mapSettings.showElevation = newValue
                            }.padding([.leading, .trailing], 16)

                        Divider()
                        
                        Picker("Map Emphasis", selection: $showEmphasis) {
                            Text("Default").tag(0)
                            Text("Muted").tag(1)
                        }.pickerStyle(MenuPickerStyle())
                            .onChange(of: showEmphasis) { newValue in
                                mapSettings.showEmphasis = newValue
                            }.padding([.leading, .trailing], 16)
                            .disabled(mapType != 0)
                    }
                }
            }
        }.navigationTitle("Settings")
            .onAppear {
                mapType = mapSettings.mapType
                showElevation = mapSettings.showElevation
                showEmphasis = mapSettings.showEmphasis
            }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @ObservedObject static var mapSettings = MapSettings()
    static var previews: some View {
        SettingsView().environmentObject(mapSettings)
    }
}
