import SwiftUI

struct FlashcardView: View {
    var card: FlashCard

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Spacer()

                    Text(card.flashcardFront)
                        .foregroundColor(.white)
                        .font(.body)
                        .fontWeight(.semibold)

                    Spacer()

                    Text(card.flashcardBack)
                        .foregroundColor(.white)
                        .font(.body)
                        .fontWeight(.regular)

                    VStack(alignment: .leading) {
                        Text(card.user.name)
                            .foregroundColor(.white)

                        Text("Topic \(card.description)")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                    .padding(.top, 32)
                }
                Spacer()
                ActionsView(card: card)
            }
            .padding(.horizontal)

            HStack {
                HStack {
                    Image(systemName: "play.rectangle.on.rectangle.fill")
                    Text(card.playlist)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .fontWeight(.semibold)
            }

                .frame(maxWidth: .infinity)
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(.black.opacity(0.5))

        }
        .background(Color("MainBackground"))

    }
}
