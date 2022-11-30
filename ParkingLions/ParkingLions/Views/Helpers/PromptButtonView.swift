//
//  PromptButtonView.swift
//  ParkingLions
//
//  Created by Xan on 11/30/22.
//

import SwiftUI

struct PromptButtonView: View {
    var title: String
    var color: Color
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(color)
                .cornerRadius(20.0)
                .shadow(radius: 3.0)
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(20.0)
                .padding(3)
            Text(title)
                .bold()
                .foregroundColor(Color.blue)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PromptButtonView(title: "Easy", color: Color.blue)
    }
}
