import SwiftUI

@main
struct RPS_7App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(HTTPClient())
        }
    }
}
