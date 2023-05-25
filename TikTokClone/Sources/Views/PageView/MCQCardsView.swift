import SwiftUI

struct MCQCardsView: View {

    private var viewModel: CardsViewModel!

    @State private var cards: [MCQCard] = []

    init(viewModel: CardsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { proxy in
            TabView {
                ForEach(cards, id: \.id) { card in
                    MCQCardView(card: card)
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .onAppear {
                            Task {
                                guard card.id == cards.last?.id else { return }
                                let newCard = try await viewModel.fetchCard()
                                guard let newCard = newCard as? MCQCard else { return }
                                cards.append(newCard)
                            }
                        }
                }
                .rotationEffect(.degrees(-90))
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .frame(width: proxy.size.height, height: proxy.size.width)
            .rotationEffect(.degrees(90), anchor: .topLeading)
            .offset(x: proxy.size.width)
            .tabViewStyle(
                PageTabViewStyle(indexDisplayMode: .never)
            )
        }
        .background(Color("MainBackground"))
        .onAppear {
            Task {
                let newCard = try await viewModel.fetchCard()
                guard let newCard = newCard as? MCQCard else { return }
                cards.append(newCard)
            }
        }
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
