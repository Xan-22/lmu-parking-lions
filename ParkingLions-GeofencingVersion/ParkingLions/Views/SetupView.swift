//
//  SetupView.swift
//  ParkingLions
//
//  Created by Xan on 10/24/22.
//

import SwiftUI

struct SetupView: View {
    @State var isStudent: Bool
    @State var complete: Bool
    var body: some View {
        VStack {
            LogoView()
            SFChoiceView(isStudent: isStudent)
        }
    }
}

struct SetupView_Previews: PreviewProvider {
    static let isStudent = false
    static let complete = false
    static var previews: some View {
        SetupView(isStudent: isStudent, complete: complete)
    }
}
