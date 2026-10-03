import SwiftUI

struct IOSBootstrapRootView: View {
    var body: some View {
        #if DEBUG
        OrrisDesignBoardView()
        #else
        Text("Orris")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        #endif
    }
}
