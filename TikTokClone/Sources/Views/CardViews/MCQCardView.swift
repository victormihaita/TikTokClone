import SwiftUI

struct MCQCardView: View {
    var card: MCQCard

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Spacer()

                    Text(card.question)
                        .foregroundColor(.white)
                        .font(.body)
                        .fontWeight(.semibold)

                    Spacer()

                    VStack(alignment: .leading, content: {
                        ForEach(card.options, id: \.id) { option in
                            Text(option.answer)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .background(.white.opacity(0.1))
                                .cornerRadius(8)
                        }
                    })

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
