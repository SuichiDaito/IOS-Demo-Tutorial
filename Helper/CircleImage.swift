//
//  CircleImage.swift
//  Landmarks
//
//  Created by ngon.tran on 25/2/25.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(.white, lineWidth: 3))
            .shadow(radius: 5)
    }
       
}

