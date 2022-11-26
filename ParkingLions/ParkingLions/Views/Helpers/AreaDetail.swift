//
//  AreaDetail.swift
//  ParkingLions
//
//  Created by Xan on 11/25/22.
//

import SwiftUI

struct AreaDetail: View {
    var parkingArea: ParkingArea
    var body: some View {
        VStack {
            Text(parkingArea.name).font(Font.title.bold())
        }
    }
}

struct AreaDetail_Previews: PreviewProvider {
    static let previewArea = parkingAreas[0]
    static var previews: some View {
        AreaDetail(parkingArea: previewArea)
    }
}
