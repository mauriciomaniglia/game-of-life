import SwiftUI

struct ContentView: View {
    @Environment(LifeViewModel.self) private var lifeViewModel

    var body: some View {
        VStack(spacing: 20) {
            GridView()
            CycleControlView()
        }
    }
}

#Preview {
    ContentView()
}
