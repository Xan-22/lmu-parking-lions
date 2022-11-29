//
//  ParkingLionsAreaService.swift
//  ParkingLions
//
//  Created by Xan on 11/28/22.
//

import Foundation

import Firebase

let COLLECTION_NAME = "parking-areas"
let AREA_LIMIT = 20

enum ServiceError: Error {
    case mismatchedDocumentError
    case unexpectedError
}

class ParkingLionsAreaService: ObservableObject {
    private let db = Firestore.firestore()
    @Published var error: Error?
    
    func fetchAreas() async throws -> [ParkingArea] {
        let articleQuery = db.collection(COLLECTION_NAME)
            .limit(to: AREA_LIMIT)
        
        let querySnapshot = try await articleQuery.getDocuments()
        return try querySnapshot.documents.map {
            guard let name = $0.get("name") as? String,
                  let lot = $0.get("lot") as? String,
                  let busyness = $0.get("busyness") as? Double else {
                throw ServiceError.mismatchedDocumentError
            }
            
            return ParkingArea(
                id: $0.documentID,
                name: name,
                lot: lot,
                busyness: busyness
            )
        }
    }
    
    func addRating(rating: Double, id: String) {
            let ref = db.collection(COLLECTION_NAME).document(id)
            ref.updateData([
                "busyness": rating  // TODO: Here we should update a different document, then change a corresponding document on Firestore.
            ]) { possibleError in   // Right now, we are just trusting the first person who answers the notification.
                if let actualError = possibleError {
                    self.error = actualError
                }
            }
        }
}
