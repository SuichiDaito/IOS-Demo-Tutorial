//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by ngon.tran on 28/2/25.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing: 10 ){
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Season Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                Divider()
                VStack(alignment: .leading){
                    Text("Completed Badge").bold().font(.title2)
                    ScrollView{
                        HStack(alignment: .top, spacing: 10){
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                            
                        }.padding(.bottom)
                    }
                    
                }
                Divider()
                VStack(alignment: .leading){
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[2])
                }
            }
            
        }.padding(.leading, 10)
    }
}

#Preview {
    ProfileSummary(profile: Profile.default).environment(ModelData())
}
