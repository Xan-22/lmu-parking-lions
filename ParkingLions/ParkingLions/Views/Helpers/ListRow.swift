//
//  ListRow.swift
//  ParkingLions
//
//  Created by Xan on 11/24/22.
//

import SwiftUI

struct ListRow: View {
    var name: String
    var busyness: Double
    var body: some View {
        HStack {
            Text(name)
            Divider()
            if busyness > 3.0 {
                Text("Very Busy")
            } else if busyness > 2.0 {
                Text("Busy")
            } else if busyness > 1.0 {
                Text("OK")
            } else {
                Text("Open")
            }
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(name: "Drollinger", busyness: 1.0)
    }
}
