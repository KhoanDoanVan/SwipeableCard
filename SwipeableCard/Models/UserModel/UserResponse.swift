//
//  UserResponse.swift
//  SwipeableCard
//
//  Created by Đoàn Văn Khoan on 16/11/24.
//

import Foundation

struct UserResponse: Identifiable {
    var id: Int
    var name: String
    var age: Int
    var imageUrl: String
    var activeType: Int
    var accountVerified: Int
    var distance: String
    var tags: [TagResponse]
}
