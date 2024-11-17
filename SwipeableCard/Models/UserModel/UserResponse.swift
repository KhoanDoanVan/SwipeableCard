//
//  UserResponse.swift
//  SwipeableCard
//
//  Created by Đoàn Văn Khoan on 16/11/24.
//

import Foundation

struct UserResponse: Identifiable {
    var id: Int
    var nameOwner: String
    var namePlant: String
    var age: Int
    var imageUrl: String
    var userUrl: String
    var activeType: Int
    var accountVerified: Int
    var distance: String
    var hearts: Int
    var tags: [TagResponse]
}
