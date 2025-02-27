//
//  LandmarkDetails.swift
//  Landmarks
//
//  Created by ngon.tran on 26/2/25.
//

import SwiftUI

struct LandmarkDetails: View {
    @Environment(ModelData.self) var modelData
    var landmark : Landmark
    
    var landmarkIndex : Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })! // nhận biết id nào được  đánh giá là favorite và don't favorite 
    }
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate).frame(height: 300)
                CircleImage(image: landmark.image)
                    .offset(y:-130)
                    .padding(.bottom ,-130)
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    HStack{
                        Text(landmark.park).font(.subheadline)
                        Spacer()
                        Text(landmark.state).font(.subheadline)
                        
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text("Category \(landmark.category)")
                        .font(.subheadline)
                    Spacer()
                
                  
                }
                .padding()
                Spacer()
            }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetails(landmark: ModelData().landmarks[0]).environment(modelData)
}
