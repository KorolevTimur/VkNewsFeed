//
//  UserResponse.swift
//  VkNewsFeed
//
//  Created by admin on 3/30/20.
//  Copyright © 2020 Timur Korolev. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
