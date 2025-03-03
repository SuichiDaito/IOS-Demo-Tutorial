//
//  CategoryRow.swift
//  Landmarks
//
//  Created by ngon.tran on 28/2/25.
//

import SwiftUI

struct CategoryRow: View { // phần trước View là phần khởi tạo, các biến khởi tạo phải được khai báo trước
    var categoryName: String
    var items: [Landmark]
    
    var body: some View { // phần này là phần View, hiển thị giao diện được thể hiện hoặc nhúng dữ liệu vào trong giao diện
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.title2)
                .padding(.leading,10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5){
                    ForEach(items){         //vòng lặp ForEach thích hợp sử dụng cho mảng, nhưng phải có biến duyệt, vậy nên landmark in là biến đại diện để duyệt mảng
                        landmark in
                        NavigationLink{
                            LandmarkDetails(landmark: landmark)
                        }label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }.frame(height: 195)
            
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks // khởi tạo model để truyền dữ liệu cần hiển thị.
    return CategoryRow(
        categoryName: landmarks[1].category.rawValue,
        items: Array(landmarks.prefix(4))
        // prefix không trả về mảng, mà trả về 1 slice.
        // Như vậy nên là phải ép kiểu Array() ở đầu
        
        
    )
}
// Dạng enum như category đều có khởi tạo các giá trị nguyên thủy (=)
// Dạng enum này có thuộc tính rawValue trong enum, là lấy ra các giá trị được gán ban đầu trong
// khi khởi tạo.
// Chỉ có dạng enum được khai báo kiểu dữ liệu là String, Int thì mới có rawValue
// Đơn giản không cần khai báo gì nhiều, chỉ cần đến phần tử đó trong list có khai báo dạng
// enum thì chỉ cần rawValue thì đều lấy được giá trị đó
