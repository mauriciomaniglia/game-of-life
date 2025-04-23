import SwiftUI

struct GridView: View {
    @Environment(LifeViewModel.self) private var lifeViewModel
    @State var gridSize: Int

    var body: some View {
        let grid = lifeViewModel.lifeModel.grid

        VStack {
            Grid(alignment: .center, horizontalSpacing: 2, verticalSpacing: 2) {
                ForEach(0..<grid.count, id:\.self) { row in
                    GridRow {
                        ForEach(0..<grid[row].count, id:\.self) { column in
                            Rectangle().fill(grid[row][column] == 1 ? .green : .black)
                        }
                    }
                }
            }
            .padding(2)
            .background(.black)
            .frame(width: 300, height: 300)

            Spacer()
                .frame(height: 40)

            Divider()

            VStack {
                Text("Number of Cycles: \(lifeViewModel.numberOfCycles)")
                    .font(.custom("Helvetica Neue", size: 22, relativeTo: .largeTitle))
                    .fontWeight(.bold)
            }

            HStack {
                Button("Reset") { lifeViewModel.reset(gridSize: self.gridSize) }
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
