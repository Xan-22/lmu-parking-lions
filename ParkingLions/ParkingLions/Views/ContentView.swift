//
//  ContentView.swift
//  ParkingLions
//
//  Created by Xan on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: AlertSettings
    @EnvironmentObject var service: ParkingLionsAreaService

    var body: some View {
        HStack {
            MainView().environmentObject(service)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AlertSettings())
            .environmentObject(ParkingLionsAreaService())
    }
}

