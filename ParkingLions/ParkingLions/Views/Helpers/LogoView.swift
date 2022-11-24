//
//  LogoView.swift
//  ParkingLions
//
//  Created by Xan on 10/24/22.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("LionLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 20)
            .overlay(alignment: .bottom) {
                Text("Parking Lions")
                    .font(.system(size: 32))
            }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
