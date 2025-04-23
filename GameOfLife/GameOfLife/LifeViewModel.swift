import SwiftUI

@Observable class LifeViewModel {
    private(set) var isRunning: Bool

    var lifeModel = LifeModel(cells: 50)

    init() {
        self.isRunning = false
    }

    var numberOfCycles: Int {
        lifeModel.numberOfCycles
    }

    func reset(gridSize: Int = 50) {
        self.isRunning = false
        self.lifeModel = LifeModel(cells: gridSize)
    }

    func step() {
        lifeModel.step()
    }

    func setGridSize(cellNumber: Int) {
        lifeModel = LifeModel(cells: cellNumber)
    }

    @MainActor
    func performNumberOfCycles(number: Int) async {
        isRunning = true

        for _ in 1...number {
            let isDifferent = await lifeModel.performStepDelay()

            if !isDifferent || !isRunning { break }
        }

        isRunning = false
    }

    @MainActor
    func stop() async {
        isRunning = false
    }
}
