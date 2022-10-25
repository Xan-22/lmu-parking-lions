//
//  SFChoiceView.swift
//  ParkingLions
//
//  Created by Xan on 10/24/22.
//

import SwiftUI

struct SFChoiceView: View {
    @State var isStudent: Bool
    var body: some View {
        Text("Please select one:")
        Text("I am a...")
            .font(.headline)
        HStack {
            Button {
                isStudent = true
            } label: {
                Text("Student")
            }
            Button {
                isStudent = false
            } label: {
                Text("Faculty")
            }
        }
    }
}

struct SFChoiceView_Previews: PreviewProvider {
    static let isStudent = false
    static var previews: some View {
        SFChoiceView(isStudent: isStudent)
    }
}
