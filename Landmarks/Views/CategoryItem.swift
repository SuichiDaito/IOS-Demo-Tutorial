//
//  CategoryItem.swift
//  Landmarks
//
//  Created by ngon.tran on 28/2/25.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading){
            landmark.image
                .resizable()
                .renderingMode(.original)
                .frame(width: 120, height: 120)
                .cornerRadius(10)
            
            Text(landmark.name)
                .font(.subheadline)
                .foregroundColor(.accentColor)
                .foregroundStyle(.primary)
            
        }
        .padding(.all, 10)
        
        
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
