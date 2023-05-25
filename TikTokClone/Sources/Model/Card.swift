//
//  Card.swift
//  TikTokClone
//
//  Created by Victor Mihaita on 15.05.2023.
//

import Foundation

protocol CardProtocol {
    var id: Int { get set }
    var type: String { get set }
    var playlist: String { get set }
    var description: String { get set }
    var user: User { get set }
}

struct FlashCard: Codable, CardProtocol {
    var id: Int
    var type: String
    var playlist: String
    var description: String
    var user: User
    var flashcardFront: String
    var flashcardBack: String

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case playlist
        case description
        case user
        case flashcardFront = "flashcard_front"
        case flashcardBack = "flashcard_back"
    }
}

struct MCQCard: Codable, CardProtocol {
    var id: Int
    var type: String
    var playlist: String
    var description: String
    var user: User
    var question: String
    var options: [Option]
}

struct Option: Codable {
    var id: String
    var answer: String
}

var dummyMCQCard: MCQCard = MCQCard(
    id: 123,
    type: "mcq",
    playlist: "Period 6: 1865-1898",
    description: "5.5 Sectional Conflict:  Regional Differences #apush",
    user: User(name: "AP US History",
               avatar: "http://cross-platform-rwa.s3-website-us-east-1.amazonaws.com/avatars/apush.png"),
    question: "What were the two largest immigrant groups during the mid-1800's?",
    options: [Option(id: "A", answer: "German and Irish"),
              Option(id: "B", answer: "Italian & German"),
              Option(id: "C", answer: "Chinese & Japanese")]
)

var dummyFlashCard: FlashCard = FlashCard(
    id: 123,
    type: "mcq",
    playlist: "Period 6: 1865-1898",
    description: "5.5 Sectional Conflict:  Regional Differences #apush",
    user: User(name: "AP US History",
               avatar: "http://cross-platform-rwa.s3-website-us-east-1.amazonaws.com/avatars/apush.png"),
    flashcardFront: "This is the title",
    flashcardBack: "This is the subtitle"
)
