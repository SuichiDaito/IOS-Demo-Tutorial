//
//  LandmarkList.swift
//  Landmarks
//
//  Created by ngon.tran on 26/2/25.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showOnlyFavorites = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark : Landmark?
    
    enum FilterCategory: String, CaseIterable, Identifiable{
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains  = "Mountains"
        
        var id: FilterCategory{ self }
    }
    
    var filteredLandmarks: [Landmark]{
        modelData.landmarks.filter{ landmark in
            (landmark.isFavorite || !showOnlyFavorites)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
        // lọc theo địa danh yêu thích khi được bật isFavorite == true
        // hiển thị hết các địa danh !showOnlyFavorite
        // filter 1 biến để duyệt
        // filter == .all lấy hết tất cả các địa danh
        // filter.rawValue (dữ liệu gốc) lọc lại các địa danh mà người dùng chọn 
    }
    var title: String{
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showOnlyFavorites ? "Favorite \(title)" : title
    }
    var index: Int?{
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        @Bindable var modelData  = modelData
        
        NavigationSplitView {
            List(selection: $selectedLandmark){
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink{
                        LandmarkDetails(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            .frame(minWidth: 300)
            .toolbar{
                ToolbarItem{
                    Menu{
                        Picker("Category", selection: $filter){
                            ForEach(FilterCategory.allCases){ category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showOnlyFavorites){
                            Label("Favorite only", systemImage: "heart.fill")
                        }
                        
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }.focusedValue( \.selectedLandmark, $modelData.landmarks[index ?? 0]  )
    }
}
    
    #Preview {
        LandmarkList().environment(ModelData())
    }
