//
//  ContentView.swift
//  Landmarks
//
//  Created by ngon.tran on 25/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
//        HikeView(hike: Hike)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
