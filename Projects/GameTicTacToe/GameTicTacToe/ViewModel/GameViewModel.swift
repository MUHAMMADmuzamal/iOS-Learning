//
//  GameViewModel.swift
//  GameTicTacToe
//
//  Created by Codes Orbit on 16/02/2024.
//

import Foundation

protocol GameViewModelProtocol: ObservableObject {
    var board: [[CellProtocol]] { get set }
    var isGameEnd: Bool { get }
    var winner: String { get }
    var nextPlayerTurn: Player { get }
    func makeMove(row: Int, column: Int)
    func resetBoard()
}

class GameViewModel: GameViewModelProtocol {
    @Published var board: [[CellProtocol]] = []
    private var allPlayers: [Player] = [Player(name: "Red", tile: CrossCell()),
                                        Player(name: "Blue", tile: NoughtCell())]
    private var playerTurn: Player
    @Published var nextPlayerTurn: Player
    var winner: String = "Tie"
    var isGameEnd: Bool = false
    private let boardSize: Int = 3
    init() {
        self.isGameEnd = false
        self.playerTurn = allPlayers[0]
        self.nextPlayerTurn = allPlayers[0]
        self.randomTurn()
        self.resetBoard()
    }
    func randomTurn() {
        let randomTurn = Int.random(in: 0...1)
        allPlayers.swapAt(0, randomTurn)
        self.playerTurn = allPlayers[0]
        self.nextPlayerTurn = allPlayers[0]
    }
    func resetBoard() {
        self.board = []
        for row in 0..<boardSize {
            board.append([])
            for _ in 0..<boardSize {
                board[row].append(EmptyCell())
            }
        }
        randomTurn()
    }
    func makeMove(row: Int, column: Int) {
        if self.board[row][column] is EmptyCell {
            playerTurn = allPlayers.removeFirst()
            nextPlayerTurn = allPlayers[0]
            self.board[row][column] = playerTurn.tile
            if checkForWinner(row: row, column: column, player: playerTurn) {
                self.isGameEnd = true
                self.winner = playerTurn.name + " Won"
            } else if checkTie() {
                self.isGameEnd = true
                self.winner = "Tie"
            }
        }
        allPlayers.append(playerTurn)
    }
    private func checkTie() -> Bool {
        for row in self.board {
            for column in row {
                if column is EmptyCell {
                    return false
                }
            }
        }
        return true
    }
    private func checkPlayerWinInRow(row: Int, player: Player) -> Bool {
        var win: Bool = false
        for column in 0..<self.board.count {
            win = self.board[row][column].tile == player.tile.tile
            if win == false {
                return win
            }
        }
        return win
    }
    private func checkPlayerWinInColumn(column: Int, player: Player) -> Bool {
        var win: Bool = false
        for row in 0..<self.board.count {
            win = self.board[row][column].tile == player.tile.tile
            if win == false {
                return win
            }
        }
        return win
    }
    private func checkPlayerWinInLeftToRightDiagonal(player: Player) -> Bool {
        var win: Bool = false
        for diagonal in 0..<self.board.count {
            win = self.board[diagonal][diagonal].tile == player.tile.tile
            if win == false {
                return win
            }
        }
        return win
    }
    private func checkPlayerWinInRightToLeftDiagonal(player: Player) -> Bool {
        var win: Bool = false
        for column in stride(from: self.board.count - 1, to: -1, by: -1) {
            win = self.board[(self.board.count - 1) - column][column].tile == player.tile.tile
            if win == false {
                return win
            }
        }
        return win
    }
    private func checkForWinner(row: Int, column: Int, player: Player) -> Bool {
        return self.checkPlayerWinInRow(row: row, player: player) ||
        self.checkPlayerWinInColumn(column: column, player: player) ||
        self.checkPlayerWinInLeftToRightDiagonal(player: player) ||
        self.checkPlayerWinInRightToLeftDiagonal(player: player)
    }
}
