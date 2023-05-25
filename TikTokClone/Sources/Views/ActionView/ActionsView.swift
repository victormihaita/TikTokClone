import SwiftUI

struct ActionsView: View {
    var card: CardProtocol

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            VStack(spacing: -8) {
                AsyncImage(url: card.user.imageUrl) { phase in
                    if let image = phase.image  {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } else if phase.error != nil {
                        Image(systemName: "exclamationmark.triangle").padding()
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 48, height: 48)
                .cornerRadius(24)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 1)
                )

                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.green)
                    .background(.white)
                    .cornerRadius(32)
                    .font(.body)
            }

            VStack(spacing: 4) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.white)
                    .font(.title)

                Text("87")
                    .font(.caption)
                    .foregroundColor(.white)
            }

            VStack(spacing: 4) {
                Image(systemName: "message.fill")
                    .foregroundColor(.white)
                    .font(.title)

                Text("2")
                    .font(.caption)
                    .foregroundColor(.white)
            }

            VStack(spacing: 4) {
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .foregroundColor(.white)
                    .font(.title)

                Text("17")
                    .font(.caption)
                    .foregroundColor(.white)
            }

            VStack(spacing: 4) {
                Image(systemName: "bookmark.fill")
                    .foregroundColor(.white)
                    .font(.title)

                Text("203")
                    .font(.caption)
                    .foregroundColor(.white)
            }

            VStack(spacing: 4) {
                Image(systemName: "repeat.circle.fill")
                    .foregroundColor(.white)
                    .font(.title)

                Text("Flip")
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
    }
}
