import Foundation

enum CardType {
    case mcq
    case flashcard

    var url: URL {
        switch self {
        case .mcq:
            return URL(string: "https://cross-platform.rp.devfactory.com/for_you")!
        case .flashcard:
            return URL(string: "https://cross-platform.rp.devfactory.com/following")!
        }
    }
}

protocol CardsProtocol {
    var type: CardType! { get set }
    func fetchCard() async throws -> CardProtocol?
}

class CardsViewModel: CardsProtocol {
    var type: CardType!

    init(type: CardType) {
        self.type = type
    }

    func fetchCard() async throws -> CardProtocol? {
        var request = URLRequest(url: type.url)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)
        switch type {
        case .mcq:
            return try JSONDecoder().decode(MCQCard.self, from: data)
        case .flashcard:
            return try JSONDecoder().decode(FlashCard.self, from: data)
        case .none:
            return nil
        }

    }
}
