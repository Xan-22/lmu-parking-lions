//
//  QuestionView.swift
//  ParkingLions
//
//  Created by Xan on 11/30/22.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var service: ParkingLionsAreaService
    @EnvironmentObject var settings: AlertSettings
    @State private var lot = ""
    
    private func addRatingAndClose(_ rating: Double) {
        if lot.count != 0 && settings.showAlert {
            service.addRating(rating: rating, id: lot)
        }
        settings.showAlert = false
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(20.0)
            VStack {
                VStack {
                    HStack {
                        Button("Close") {
                            settings.showAlert = false
                        }
                        .padding(.bottom, 10)
                        .padding(.leading, 25)
                        Spacer()
                    }
                    Text("How was parking?")
                        .font(.title)
                        .padding(.bottom, 10)
                }
                HStack {
                    Button {
                        addRatingAndClose(0.0)
                    } label: {
                        PromptButtonView(title: "Easy", color: Color.green)
                    }.frame(width: 100, height: 40)
                    Button {
                        addRatingAndClose(2.0)
                    } label: {
                        PromptButtonView(title: "Medium", color: Color.orange)
                    }.frame(width: 100, height: 40)
                    Button {
                        addRatingAndClose(4.0)
                    } label: {
                        PromptButtonView(title: "Hard", color: Color.red)
                    }.frame(width: 100, height: 40)
                }
            }
        }.onAppear {
            if settings.lot != nil {
                lot = settings.lot!
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    @ObservedObject static var settings = AlertSettings()
    static var previews: some View {
        QuestionView()
            .environmentObject(ParkingLionsAreaService())
            .environmentObject(settings)
            .onAppear {
                settings.showAlert = true
                settings.lot = "A"
            }
    }
}
