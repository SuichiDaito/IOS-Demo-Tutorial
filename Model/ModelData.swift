//
//  ModelData.swift
//  Landmarks
//
//  Created by ngon.tran on 26/2/25.
//

import Foundation

@Observable
class ModelData {
    var landmarks : [ Landmark ] = load("landmarkData") // thực hiện đọc file
    var hikes : [ Hike ] = load("hikeData") // thực hiện đọc file
    var profile = Profile.default

    var features: [Landmark]{
        landmarks.filter{ $0.isFeatured }
    }
    
    var categories: [String:[Landmark]]{
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
        
    }
}




func load<T: Decodable> (_ filename: String) -> T{       //chuyển đổi từ file Json thành struct Landmark
    let data : Data // khởi tạo dữ liệu Data...
    
    guard let file  = Bundle.main.url(forResource: filename, withExtension: "json") // tiến hành đọc file có trong thư mục, withExtension là đuôi thư mục mà cần lấy
    else{
        fatalError(" Couldn't find \(filename) in main bundle")
    }
    
    do {
        data  =  try Data(contentsOf: file)
    }
    catch{
        fatalError(" Couldn't find \(filename) in main bundle")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch {
        fatalError("Could'n parse \( filename ) as \(T.self) : \(error)")
    }
    
}
