//
//  HikeView.swift
//  Landmarks
//
//  Created by ngon.tran on 27/2/25.
//

import SwiftUI

struct HikeView: View {
    
    @Environment(ModelData.self) var modelData
    
    var hike: Hike
    @State var keyPath: KeyPath<Hike.Observations, Range<Double>> = \.elevation
    @State  private var showDetail = false

    
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView(.vertical){
            VStack(alignment: .center){
                HStack{
                    HikeGraph(hike: modelData.hikes[2], path: \.elevation).frame(width: 50, height: 30)
                    VStack(alignment: .leading){
                        Text(modelData.hikes[2].name).bold().font(.headline)
                        Text(modelData.hikes[2].distanceText)
                    }
                    Spacer()
                    Button{
                        showDetail.toggle()
                    }label: {
                        Label("Graph", systemImage: "chevron.right.circle")
                            .labelStyle(.iconOnly)
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDetail ? 90 : 0))
                            .scaleEffect(showDetail ? 1.5 : 1)
                            .padding(.trailing, 20)
                    }
                }
                .padding(.bottom, 30)
                Spacer()
                if showDetail {
                    HikeGraph(hike: modelData.hikes[2], path: keyPath).frame(width: 150, height: 150).padding(.bottom, 100).padding(.top, 20)
                }
                HStack{
                    Button{
                        keyPath = \.elevation
                        }label: {
                            Label("Elevation", systemImage: "chevron.right.circle")
                                .labelStyle(.titleOnly)
                                .font(.title2)
                                .padding(.trailing, 20)
                        }
                        Spacer()
                    Button{
                        keyPath = \.pace
                        }label: {
                            Label("Pace", systemImage: "chevron.right.circle")
                                .labelStyle(.titleOnly)
                                .font(.title2)
                                .padding(.trailing, 20)
   
                        }
                        Spacer()
                        Button{
                            keyPath = \.heartRate
                        }label: {
                            Label("Heartrate", systemImage: "chevron.right.circle")
                                .labelStyle(.titleOnly)
                                .font(.title2)
                                .padding(.trailing, 20)
                        }
                    }.padding(.all, 20)
                }
                
            }.padding(.top, 30)
            
        }
    }

#Preview {
    let modelData = ModelData()
    return HikeView(hike: modelData.hikes[2]).environment(ModelData())
}
