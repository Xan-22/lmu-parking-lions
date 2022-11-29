//
//  ListRow.swift
//  ParkingLions
//
//  Created by Xan on 11/24/22.
//

import SwiftUI

struct ListRow: View {
    var name: String
    var lot: String
    var busyness: Double
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name).bold()
                Text("Lot " + lot).font(.subheadline)
            }
            Spacer()
            Divider()
            VStack {
                if busyness >= 3.0 {
                    Image("busyness4")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    Text("Very Busy").font(.callout)
                } else if busyness >= 2.0 {
                    Image("busyness3")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    Text("Busy").font(.callout)
                } else if busyness >= 1.0 {
                    Image("busyness2")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    Text("OK").font(.callout)
                } else {
                    Image("busyness1")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    Text("Open").font(.callout)
                }
            }
            .frame(width: 80, height: 100)
            .padding(.leading, 10)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ListRow(name: "Drollinger", lot: "L", busyness: 0.0)
            ListRow(name: "Drollinger", lot: "L", busyness: 1.0)
            ListRow(name: "Drollinger", lot: "L", busyness: 2.0)
            ListRow(name: "Drollinger", lot: "L", busyness: 3.0)
        }
    }
}
