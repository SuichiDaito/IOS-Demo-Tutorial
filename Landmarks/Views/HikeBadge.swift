//
//  HikeBadge.swift
//  Landmarks
//
//  Created by ngon.tran on 28/2/25.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            Badge()
                .frame(width: 500, height: 250)
                .scaleEffect(1.0/3.0)   
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).") // nhãn sẽ tự động được đọc lên khi người dùng sử dụng Voice Over
            
        }
    }
}

#Preview {
    HikeBadge(name: "Preview Testing")
}
