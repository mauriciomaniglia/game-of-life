import SwiftUI

struct GridView: View {
    @Environment(LifeViewModel.self) private var lifeViewModel

    var body: some View {
        let grid = lifeViewModel.lifeModel.grid

        VStack {
            Grid(alignment: .center, horizontalSpacing: 2, verticalSpacing: 2) {
                ForEach(0..<grid.count, id:\.self) { row in
                    GridRow {
                        ForEach(0..<grid[row].count, id:\.self) { column in
                            Rectangle().fill(grid[row][column] == 1 ? .mint : .black)
                        }
                    }
                }
            }
            .padding(2)
            .background(.black)
            #if os(iOS)
            .frame(width: 350, height: 350)
            #else
            .frame(width: 700, height: 700)
            #endif

            Spacer()
                .frame(height: 40)            

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
