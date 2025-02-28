//
//  Profile.swift
//  Landmarks
//
//  Created by ngon.tran on 28/2/25.
//

import Foundation

struct Profile{
    var username: String
    var prefersNotifications  = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "NgocCan") // `` dùng để khai báo nếu có trùng với các từ khóa đặc biệt
    
    enum Season: String, CaseIterable, Identifiable{
        case spring = "🥰"
        case autumn = "🤣"
        case winter = "😱"
        case summer = "😡"
        var id: String {rawValue}
    }
    
    
    
}
// khai báo enum thì phải có CaseInterable: là các case, các trường hợp trong case
// Identifiable:  là khai báo để swift biết được Id của cái nào

