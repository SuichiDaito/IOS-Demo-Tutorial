//
//  Hike.swift
//  Landmarks
//
//  Created by ngon.tran on 27/2/25.
//

import Foundation

struct Hike: Hashable, Codable, Identifiable{
    var name: String
    var id: Int
    var distance: Double
    var difficulty: Int
    var observations: [Observations]
    
    static var forrmater = LengthFormatter()
    var distanceText: String{
        Hike.forrmater.string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observations : Codable, Hashable{
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
        var distanceFromStart: Double
    }
    
    

}
