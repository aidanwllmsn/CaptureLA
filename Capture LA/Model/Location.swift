//
//  Location.swift
//  Capture LA
//
//  Created by Aidan Williamson on 3/21/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Location: Hashable, Identifiable, Codable {
    var id: Int
    var name: String
    var address: String
    var description: String
    var isFavorite: Bool
    
    var category: Category
    
    enum Category: String, CaseIterable, Codable {
        case downtown = "Downtown"
        case hollywood = "Hollywood"
        case coast = "Coast"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
