//
//  FloatingButton.swift
//  ParkingLions
//
//  Created by Xan on 11/6/22.
//

import SwiftUI

struct FloatingButton: View {
    var imageName: String
    var body: some View {
            ZStack() {
                Circle()
                    .foregroundColor(.blue)
                    .shadow(color: .gray, radius: 5)
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding()
            }
        }
}

struct FloatingButton_Previews: PreviewProvider {
    static var img = "line.3.horizontal"
    static var previews: some View {
        FloatingButton(imageName: img)
    }
}
