//
//  ContentView.swift
//  Landmarks
//
//  Created by ngon.tran on 25/2/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab{
        case featured
        case list
    }
    var body: some View {
        TabView(selection: $selection){
                CategoryHome()
                    .tabItem {
                        Label("Features", systemImage: "star")
                    }.tag(Tab.featured)
                LandmarkList()
                    .tabItem {
                        Label("List", systemImage: "list.bullet").font(.caption)
                    }.tag(Tab.list)
        
        }
//        LandmarkList()
////        HikeView(hike: Hike)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
