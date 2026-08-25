import SwiftUI

@main
struct LensApp: App {
    var body: some Scene {
        WindowGroup {
            LensWebView()
                .ignoresSafeArea()
                .preferredColorScheme(.dark)
        }
    }
}
