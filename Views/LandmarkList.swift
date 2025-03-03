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
    // lưu biến cục bộ , khi giá trị thay đổi, swift tự động cập nhật giao diện tương ứng
    // nếu sử dụng showDetail.toggle thì chỉ cần xác định showDetail có true hay không
    @State private var filter = FilterCategory.all
    
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
    }
    var title: String{
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showOnlyFavorites ? "Favorite \(title)" : title
    }
 
    var body: some View {
        NavigationSplitView {
            List{
                Toggle(isOn: $showOnlyFavorites){
                    Text("Favorites Only")
                }
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink{
                        LandmarkDetails(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }
            .animation(.default, value: showOnlyFavorites)
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
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                    
                    
                }
            }
            
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
