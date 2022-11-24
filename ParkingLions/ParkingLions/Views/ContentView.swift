//
//  ContentView.swift
//  ParkingLions
//
//  Created by Xan on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: AlertSettings

    enum ResidenceHall {
        case DelReySouth
        case DelRayNorth
        case Desmond
        case Dohney
        case PalmNorth
        case Rosecrans
        case Whelan
        case None
    }
    @State var residenceHall = ResidenceHall.None

    var body: some View {
        VStack {
            HStack{
                if (settings.showAlert){
                    Text("Counter: \(settings.showAlert ? "True" : "False")")
                }
//                Text("Counter: \(settings.showAlert ? counter = true : counter = false)")
                Text("User at destination: \(settings.showAlert ? "Yes" : "No")")
            }
            MainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

