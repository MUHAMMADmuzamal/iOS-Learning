////
////  ContentViewModel.swift
////  TicTacToe
////
////  Created by codes orbit on 28/08/2023.
////
//
//import Foundation
//
//class ContentViewModel: ObservableObject{
//    @Published var gameMatrix:[Int][Int] = [
//        [0,0,0],
//        [0,0,0],
//        [0,0,0]
//    ]
//    
//    let playerOneWinSum = 3
//    let playerTwoWinSum = 6
//    func updateGameMatrix(row:Int, column:Int, player:Player) {
//        guard gameMatrix[row][column] == 0 else{
//            return
//        }
//        gameMatrix[row][column] = value
//    }
//    
//    func sumHorizontal(row:Int) -> Int {
//        sum = 0
//        for j in 0..<3{
//            sum += gameMatrix[row][j]
//        }
//        return sum
//    }
//    func sumVertical(column:Int) -> Int {
//        sum = 0
//        for j in 0..<3{
//            sum += gameMatrix[j][column]
//        }
//        return sum
//    }
//    func sumDiagonalRightToLeft() -> Int {
//        sum = 0
//        for j in 0..<3{
//            sum += gameMatrix[j][j]
//        }
//        return sum
//    }
//    func sumDiagonalLeftToRight() -> Int {
//        sum = 0
//        for j in 2..0{
//            sum += gameMatrix[j][j]
//        }
//        return sum
//    }
//    
//    func checkWinStatus() -> Player {
//        for i in 0..<3{
//            if sumHorizontal(row: i) == playerOneWinSum || sumVertical(column: i) == playerOneWinSum
//                return Player.playerOne
//            if sumHorizontal(row: i) == playerTwoWinSum || sumVertical(column: i) == playerTwoWinSum
//                return Player.playerTwo
//        }
//        
//        if sumDiagonalLeftToRight() == playerOneWinSum || sumDiagonalRightToLeft() == playerOneWinSum
//            return Player.playerOne
//            
//            if sumDiagonalLeftToRight() == playerTwoWinSum || sumDiagonalRightToLeft() == playerTwoWinSum
//            return Player.playerTwo
//            
//            return Player.tie
//    }
//    
//    
//}
//
//enum Player{
//    case playerOne, playerTwo, tie
//}
