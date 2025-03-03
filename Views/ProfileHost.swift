//
//  ProfileHost.swift
//  Landmarks
//
//  Created by ngon.tran on 28/2/25.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default // cái thông tin name, date, icon có thể thay đổi => khi thay đổi xong phải cập nhật
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                if editMode?.wrappedValue == .active{
                    Button("Cancel", role: .cancel){
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: modelData.profile)
            }else{
                ProfileEditor(profile: $draftProfile)
                .onAppear{
                    draftProfile = modelData.profile
                }
                .onDisappear{
                    modelData.profile = draftProfile
                }
            }
            
        }.padding()
      
    }
    // onAppear khi mở trang profile Editor thì thông tin lấy từ modelData => lấy từ JSON
    // onDisappear thì khi đóng lại thông tin sẽ được cập nhật vào trong modelData =>  cập nhật vào trong Json
}

#Preview {
    ProfileHost()
}
