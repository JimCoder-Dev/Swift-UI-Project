import SwiftUI

@main
struct iOSTakeHomeProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                PeopleView()
                    .tabItem{
                        Symbols.person
                        Text("Home")
                    }
                SettingsView()
                    .tabItem{
                        Symbols.gear
                        Text("Settings")
                    }
            }
        }
    }
}
