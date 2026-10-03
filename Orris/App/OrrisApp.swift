import SwiftUI

@main
struct OrrisApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            MacOSBootstrapRootView()
            #elseif os(iOS)
            IOSBootstrapRootView()
            #endif
        }
    }
}
