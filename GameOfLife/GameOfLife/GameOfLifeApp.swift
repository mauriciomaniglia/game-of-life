import SwiftUI

@main
struct GameOfLifeApp: App {
    @State private var lifeViewModel = LifeViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(lifeViewModel)
        }
    }
}
