//
//  HikeGraph.swift
//  Landmarks
//
//  Created by ngon.tran on 27/2/25.
//

import SwiftUI

struct HikeGraph: View {
    var hike: Hike
    var path: KeyPath<Hike.Observations, Range<Double>>
    
    var color: Color{
        switch path {
        case \.elevation:
            return .gray
        case \.pace:
            return .blue
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        default:
            return .black
        }
    }
    
    func rangeOfRanges<T: Collection>(_ ranges: T) -> Range<Double>
    where T.Element == Range<Double>{
        guard !ranges.isEmpty else { return 0..<0 }
         
        let minValue = ranges.lazy.map{ $0.lowerBound }.min()!
        let maxValue = ranges.lazy.map{ $0.upperBound }.max()!
        
        return minValue..<maxValue
    }
    
    func magnitude(of range: Range<Double>) -> Double {
        return abs(range.lowerBound - range.upperBound)
    }
 

        
    var body: some View {
        let data = hike.observations
        let overallRange = rangeOfRanges( data.lazy.map {$0[keyPath: path]} )  // giá trị tổng quát trong khoảng lowerBound và upperBound.
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()! // xác định giá trị hiện tại
        let heighRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange)) // chiều cao tổng thể được tính khoảng tổng quát và giá trị hiện tại
        
        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120){
                ForEach(Array(data.enumerated()), id: \.offset ){
                    index, observation in
                    GraphCapsule(index: index, color: color, height: proxy.size.height, range: observation[keyPath: path] , overallRange: overallRange)
                        
                }
                
            }
            
        }
        
    }
}

//#Preview {
//    HikeGraph()
//}
