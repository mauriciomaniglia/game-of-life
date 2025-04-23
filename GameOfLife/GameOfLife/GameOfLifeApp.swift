import SwiftUI

@main
struct GameOfLifeApp: App {

    /// The app's state.
    @State private var lifeViewModel = LifeViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(lifeViewModel)
        }
    }
}
