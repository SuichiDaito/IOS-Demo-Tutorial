//
//  PageView.swift
//  Landmarks
//
//  Created by ngon.tran on 3/3/25.
//

import SwiftUI

struct PageView<Page: View>:View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages:pages, currentPage: $currentPage)
            PageControl( numberOfPages: pages.count, currentPage: $currentPage )
                .frame(width: CGFloat( pages.count * 18 ))
                .padding(.trailing)
        }
        .aspectRatio( 3/2 ,contentMode: .fit)
        // 3/2 tỉ lệ chiều rộng trên chiều cao 
    }
}

#Preview {
    PageView(pages: ModelData().features.map{ FeatureCard(landmark: $0) })
}
