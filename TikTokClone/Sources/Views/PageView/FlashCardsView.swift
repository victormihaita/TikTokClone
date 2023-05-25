import SwiftUI

struct FlashCardsView: View {

    private var viewModel: CardsViewModel!

    @State private var cards: [FlashCard] = []

    init(viewModel: CardsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { proxy in
            TabView {
                ForEach(cards, id: \.id) { card in
                    FlashcardView(card: card)
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .onAppear {
                            Task {
                                guard card.id == cards.last?.id else { return }
                                let newCard = try await viewModel.fetchCard()
                                guard let newCard = newCard as? FlashCard else { return }
                                cards.append(newCard)
                            }
                        }
                }
                .rotationEffect(.degrees(-90))
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .task {
                let newCard = try? await viewModel.fetchCard()
                guard let newCard = newCard as? FlashCard else { return }
                cards.append(newCard)
            }
            .frame(width: proxy.size.height, height: proxy.size.width)
            .rotationEffect(.degrees(90), anchor: .topLeading)
            .offset(x: proxy.size.width)
            .tabViewStyle(
                PageTabViewStyle(indexDisplayMode: .never)
            )
        }
        .background(Color("MainBackground"))
    }
}
