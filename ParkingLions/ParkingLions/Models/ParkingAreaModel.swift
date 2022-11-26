//
//  ParkingArea.swift
//  ParkingLions
//
//  Created by Xan on 11/24/22.
//

import Foundation
import SwiftUI
import CoreLocation

enum AreaBusyness {
    case low
    case medium
    case high
    case full
}

struct ParkingArea: Hashable, Codable {
    var id: Int
    var name: String
    var busyness: Double
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    private var boundaries: [Coordinates]
    
    var boundaryCoordinates: [CLLocationCoordinate2D] {
        var coords: [CLLocationCoordinate2D] = []
        for coordinate in boundaries {
            coords.append(CLLocationCoordinate2D(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude))
        }
        return coords
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}

var parkingAreas: [ParkingArea] = load("parkingAreaData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
