//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by ngon.tran on 26/2/25.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark : Landmark
    var body: some View {
        HStack{
            landmark.image.resizable().frame(
                width: 70,
                height: 70
            ).clipShape(
                /*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/
            ).scaledToFit()
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(
                    landmark.name
                ).bold()
#if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
#endif
            }
            Spacer()
            if landmark.isFavorite {
                Image(
                    systemName: "heart.fill"
                ).imageScale(
                    /*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/
                ).bold().foregroundColor(
                    .red
                )
            }
        }.padding(.vertical, 4)
    }
}


#Preview {
    let landmarks = ModelData().landmarks
    return Group{
        LandmarkRow(
            landmark: landmarks[0]
        )
        LandmarkRow(
            landmark: landmarks[1]
        )
    }
}


