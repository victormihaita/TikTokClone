import SwiftUI

struct ContentView: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.white.withAlphaComponent(0.4)
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            Text("Discover")
                .tabItem {
                    Label("Discover", systemImage: "map")
                }

            Text("Activity")
                .tabItem {
                    Label("Activity", systemImage: "clock")
                }

            Text("Bookmarks")
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark")
                }

            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .background(Color("MainBackground"))
        .accentColor(.white)
        .toolbarBackground(.black, for: .tabBar)
    }
}
