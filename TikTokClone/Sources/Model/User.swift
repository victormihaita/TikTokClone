//
//  User.swift
//  TikTokClone
//
//  Created by Victor Mihaita on 15.05.2023.
//

import Foundation

struct User: Codable {
    var name: String
    var avatar: String

    var imageUrl: URL { URL(string: avatar)! }
}
