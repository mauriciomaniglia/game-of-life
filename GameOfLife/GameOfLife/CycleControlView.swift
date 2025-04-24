import SwiftUI

struct CycleControlView: View {
    @Environment(LifeViewModel.self) private var lifeViewModel

    var body: some View {
        VStack {
            VStack {
                Text("Number of Cycles: \(lifeViewModel.numberOfCycles)")
                    .font(.custom("Helvetica Neue", size: 22, relativeTo: .largeTitle))
                    .fontWeight(.bold)
            }

            HStack {
                Button("Reset") { lifeViewModel.reset() }
                    .disabled(lifeViewModel.isRunning)

                Button("Step") { lifeViewModel.step() }
                    .disabled(lifeViewModel.isRunning)
            }

            HStack {
                Button("Start") {
                    Task {
                        await lifeViewModel.performNumberOfCycles(number: 1000)
                    }
                }
                .disabled(lifeViewModel.isRunning)

                Button("Stop") {
                    Task {
                        await lifeViewModel.stop()
                    }
                }
                .disabled(!lifeViewModel.isRunning)
            }
        }
    }
}
