//
//  AreaDetail.swift
//  ParkingLions
//
//  Created by Xan on 11/25/22.
//

import SwiftUI

struct AreaDetail: View {
    var name: String
    var busyness: Double
    var body: some View {
        VStack {
            Text(name).font(Font.title.bold())
        }
    }
}

struct AreaDetail_Previews: PreviewProvider {
    static var previews: some View {
        AreaDetail(name: "Drollinger", busyness: 0.0)
    }
}
