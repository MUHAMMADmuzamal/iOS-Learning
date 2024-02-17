//
//  ContentView.swift
//  GameTicTacToe
//
//  Created by Codes Orbit on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = GameViewModel()
    let borderSize: CGFloat = 5
    var body: some View {
        VStack {
            Text("Player Move: \(viewModel.nextPlayerTurn.name) - \(viewModel.nextPlayerTurn.tile.tile)")
                .foregroundStyle(viewModel.nextPlayerTurn.tile.displayColor)
                .bold()
            VStack(spacing: borderSize) {
                ForEach(0...2, id: \.self) { row in
                    HStack(spacing: borderSize) {
                        ForEach(0...2, id: \.self) { column in
                            CellView(cellType: viewModel.board[row][column])
                                .onTapGesture {
                                    viewModel.makeMove(row: row, column: column)
                                }
                        }
                    }
                }
            }
            .background(Color.black)
            .padding()
            .alert("Game Status", isPresented: $viewModel.isGameEnd, presenting: viewModel.winner) { _ in
                Button("Ok") {
                    self.viewModel.resetBoard()
                }
            }message: { player in
                Text("Result: " + player)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct CellView: View {
    let cellType: CellProtocol
    var body: some View {
        Text(cellType.tile)
            .font(.system(size: 60))
            .bold()
            .foregroundStyle(cellType.displayColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .aspectRatio(1, contentMode: .fit)
    }
}
