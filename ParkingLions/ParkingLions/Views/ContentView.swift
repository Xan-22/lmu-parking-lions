//
//  ContentView.swift
//  ParkingLions
//
//  Created by Xan on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    enum ResidenceHall {
        case DelReySouth
        case DelRayNorth
        case Desmond
        case Dohney
        case PalmNorth
        case Rosecrans
        case Whelan
        case Faculty
    }
    @State var residenceHall = ResidenceHall.Faculty
    @State var isStudent = false
    @State var setupComplete = false
    
    var body: some View {
        MapView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
