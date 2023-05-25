//
//  MCQCardViewModel.swift
//  TikTokClone
//
//  Created by Victor Mihaita on 25.05.2023.
//

import Foundation

class MCQCardViewModel: ObservableObject {
    func revealAnswer(for id: Int) async throws -> Answer?  {
        var request = URLRequest(url: URL(string: "https://cross-platform.rp.devfactory.com/reveal?id=\(String(id))")!)
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Answer.self, from: data)
    }

    func compare(selectedOption: Option, correctOption: Option) -> Bool {
        return selectedOption.id == correctOption.id
    }
}
