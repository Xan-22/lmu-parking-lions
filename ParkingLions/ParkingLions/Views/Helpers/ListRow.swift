//
//  ListRow.swift
//  ParkingLions
//
//  Created by Xan on 11/24/22.
//

import SwiftUI

struct ListRow: View {
    var parkingArea: ParkingArea
    var body: some View {
        HStack {
            Text(parkingArea.name)
            Divider()
            if parkingArea.busyness > 3.0 {
                Text("Very Busy")
            } else if parkingArea.busyness > 2.0 {
                Text("Busy")
            } else if parkingArea.busyness > 1.0 {
                Text("OK")
            } else {
                Text("Open")
            }
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static let previewArea = parkingAreas[0]
    static var previews: some View {
        ListRow(parkingArea: previewArea)
    }
}
