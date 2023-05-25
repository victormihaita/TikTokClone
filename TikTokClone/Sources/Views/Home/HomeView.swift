import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel = HomeViewModel()

    @State public var tabViewSelection = 0

    @Namespace private var animation

    let flashCardsView = FlashCardsView(viewModel: .init(type: .flashcard))
    let mcqCardsView = MCQCardsView(viewModel: .init(type: .mcq))

    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "clock.fill")
                    Text(viewModel.timer)
                }

                tagsView()

                Button {
                    print("Serch tapped")
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
            .padding(.horizontal)
            .foregroundColor(.white)

            TabView(selection: $tabViewSelection) {
                flashCardsView
                    .tag(0)
                mcqCardsView
                    .tag(1)
            }
            .tabViewStyle(
                PageTabViewStyle(indexDisplayMode: .never)
            )
        }
        .background(Color("MainBackground"))
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                viewModel.timeSinceStart()
            }
        }
    }

    @ViewBuilder
    func tagsView() -> some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(viewModel.tags, id: \.title) { tag in
                        VStack(spacing: 0) {
                            Text(tag.title)
                                .font(.body)
                                .fontWeight(viewModel.activeTag == tag ? .bold : .regular)
                                .padding(.horizontal, 8 * 1.5)
                                .padding(.vertical, 8)

                            if viewModel.activeTag == tag {
                                Capsule()
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                                    .frame(width: 32, height: 4)
                            } else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 4)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)) {
                                proxy.scrollTo(tag, anchor: .center)
                                viewModel.activeTag = tag
                                tabViewSelection = tag.index
                            }
                        }
                    }
                }.padding(.horizontal, 8 * 2)
            }
        }
    }
}
