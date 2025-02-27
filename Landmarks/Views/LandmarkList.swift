//
//  LandmarkList.swift
//  Landmarks
//
//  Created by ngon.tran on 26/2/25.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showOnlyFavorites = false // lưu biến cục bộ , khi giá trị thay đổi, swift tự động cập nhật giao diện tương ứng 
    
    var filteredLandmarks: [Landmark]{
        modelData.landmarks.filter{ landmark in
            (landmark.isFavorite || !showOnlyFavorites)
        }
    }
 
    var body: some View {
        NavigationSplitView {
            Toggle(isOn: $showOnlyFavorites){
                Text("Favorites only")
            }.padding(.leading, 15).padding(.trailing,16)
            List(filteredLandmarks){
                landmark in
                NavigationLink{
                    LandmarkDetails(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }.animation(.default, value: showOnlyFavorites)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
