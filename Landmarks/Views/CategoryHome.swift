//
//  CategoryHome.swift
//  Landmarks
//
//  Created by ngon.tran on 28/2/25.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    var body: some View {
        
        NavigationSplitView{
            VStack(alignment: .leading) {
                List{
                    modelData.features[0].image // lấy ảnh đầu tiên của features trong JSON
                        .resizable()
                        .frame(height: 180) // set chiều cao
                        .clipped()
                        .scaledToFill() // lấy ảnh đầu tiên
                        .listRowInsets(EdgeInsets()) //
                    ForEach( modelData.categories.keys.sorted(), id: \.self ){
                        key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]! )
                            .padding(.leading, 30)
                    }
                    .listRowInsets(EdgeInsets())
                  
                }
                .listStyle(.inset)
                .navigationTitle("Features")
                .toolbar{
                    Button{
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }.sheet(isPresented: $showingProfile){
                    ProfileHost().environment(modelData)
                }
                
            }
        } detail: {
            Text("Select Hello World")
        }
    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
