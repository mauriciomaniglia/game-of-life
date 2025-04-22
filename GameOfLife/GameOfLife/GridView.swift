//
//  GridView.swift
//  GameOfLife
//
//  Created by Mauricio Cesar on 22/04/25.
//

import SwiftUI

struct GridView: View {

    let gridData = [
        [1, 1, 0, 0, 0],
        [0, 1, 0, 1, 0],
        [0, 0, 0, 0, 0],
        [0, 1, 0, 0, 1],
        [0, 0, 0, 1, 0]
    ]

    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 2, verticalSpacing: 2) {
            ForEach(0..<gridData.count, id:\.self) { row in
                GridRow {
                    ForEach(0..<gridData[row].count, id:\.self) { column in
                        Rectangle().fill(gridData[row][column] == 1 ? .green : .gray)
                    }
                }
            }
        }
        .padding(2)
        .background(.black)
        .frame(width: 300, height: 300)

        Spacer()
            .frame(height: 40)

    }
}
