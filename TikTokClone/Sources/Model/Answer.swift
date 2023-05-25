//
//  Answer.swift
//  TikTokClone
//
//  Created by Victor Mihaita on 25.05.2023.
//

import Foundation

struct Answer: Codable {
    var id: Int
    var correctOptions: [Option]

    enum CodingKeys: String, CodingKey {
        case id
        case correctOptions = "correct_options"
    }
}
