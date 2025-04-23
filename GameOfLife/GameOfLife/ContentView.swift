import SwiftUI

struct ContentView: View {
    @Environment(LifeViewModel.self) private var lifeViewModel

    var body: some View {
        GridView(gridSize: 50)
    }
}

#Preview {
    ContentView()
}
