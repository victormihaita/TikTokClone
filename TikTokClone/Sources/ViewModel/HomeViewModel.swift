import Foundation

enum TabViewElement: Equatable, Hashable {
    case following
    case forYou

    var title: String {
        switch self {
        case .following:
            return "Following"
        case .forYou:
            return "For You"
        }
    }

    var index: Int {
        switch self {
        case .following:
            return 0
        case .forYou:
            return 1
        }
    }
}

class HomeViewModel: ObservableObject {

    private var startTime: Date

    @Published var timer: String = "0s"
    @Published public var tags: [TabViewElement] = [.following, .forYou]
    @Published public var activeTag: TabViewElement = .following

    init() {
        startTime = Date()
    }

    func timeSinceStart() {
        let elapsedTime = Date().timeIntervalSince(startTime)

        let minutes = Int(elapsedTime.truncatingRemainder(dividingBy: 3600) / 60)
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))

        if minutes < 1 {
            timer = "\(seconds)s"
            return
        }
        timer = "\(minutes)m"
    }
}
