//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by ngon.tran on 28/2/25.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    var dateRange: ClosedRange<Date>{  // duyệt trong một đoạn giá trị, trả về khoảng giá trị lớn nhất và bé nhất
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max    // lấy hết tất cả giá trị bao gồm cả hai đầu múc
    }
    
    var body: some View {
        List{
            HStack{
                Text("Username: ")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            Toggle(isOn: $profile.prefersNotifications){
                Text("Enable Notifications")
            }
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto){
                ForEach(Profile.Season.allCases){ 
                    season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date){
                Text("Goal Date")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
