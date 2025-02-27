//
//  Lanmark.swift
//  Landmarks
//
//  Created by ngon.tran on 26/2/25.
//

import Foundation
import SwiftUI
import CoreLocation


struct Landmark: Hashable,Codable, Identifiable {
    var id: Int
    var name : String
    var category : String
    var city : String
    var state : String
    var isFavorite: Bool
    var park: String
    
    private var imageName : String
    var image : Image {
        Image(imageName)
    }
    private var coordinates : Coordinates
    
    var locationCoordinate : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }

    struct Coordinates : Hashable, Codable{
        var latitude : Double
        var longitude : Double
    }
    
    
    
    
    
    
    
    
}
