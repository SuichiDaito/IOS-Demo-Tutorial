//
//  GraphCapsule.swift
//  Landmarks
//
//  Created by ngon.tran on 27/2/25.
//

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var color: Color
    var height: CGFloat 
    var range: Range<Double>
    var overallRange: Range<Double>
    
    var heightRatio: CGFloat{
        CGFloat((range.upperBound - range.lowerBound)/(overallRange.upperBound - overallRange.lowerBound))  // trả về một khoảng cách từ đáy để vẽ hình
    }
    var offsetRatio: CGFloat{
        CGFloat((range.upperBound - overallRange.lowerBound) / (overallRange.upperBound - overallRange.lowerBound))
    }
    
    var body: some View {
        Capsule()
            .fill(color)
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * (1 - offsetRatio - heightRatio ))
    }
}

