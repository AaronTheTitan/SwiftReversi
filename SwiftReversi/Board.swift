//
//  Board.swift
//  SwiftReversi
//
//  Created by Aaron Bradley on 5/15/15.
//  Copyright (c) 2015 razeware. All rights reserved.
//

import Foundation

class Board {

  private var cells: [BoardCellState]
  let boardSize = 8
  private let boardDelegates = DelegateMulticast<BoardDelegate>()


  init() {
    cells = Array(count: boardSize * boardSize, repeatedValue: BoardCellState.Empty)
  }

  subscript(location: BoardLocation) -> BoardCellState {
    get {
      assert(isWithinBounds(location), "row or column index out of bounds")
      return cells[location.row * boardSize + location.column]
    }
    set {
      assert(isWithinBounds(location), "row or column index is out of bounds")
      cells[location.row * boardSize + location.column] = newValue
      boardDelegates.invokeDelegates { $0.cellStateChanged(location) }
    }
  }

  subscript(row: Int, column: Int) -> BoardCellState {
    get {
      return self[BoardLocation(row: row, column: column)]
    }
    set {
      self[BoardLocation(row: row, column: column)] = newValue
    }
  }

  func isWithinBounds(location: BoardLocation) -> Bool {
    return location.row >= 0 && location.row < boardSize && location.column >= 0 && location.column < boardSize
  }

  func cellVisitor(fn: (BoardLocation) -> ()) {
    for column in 0..<boardSize {
      for row in 0..<boardSize {
        let location = BoardLocation(row: row, column: column)
        fn(location)
      }
    }
  }

  func clearBoard() {
    cellVisitor { self[$0] = .Empty }
  }

  func addDelegate(delegate: BoardDelegate) {
    boardDelegates.addDelegate(delegate)
  }

  func countMatches(fn: (BoardLocation) -> Bool) -> Int {
    var count = 0
    cellVisitor { if fn($0) { count++ } }
    return count
  }

  func anyCellsMatchCondition(fn: (BoardLocation) -> Bool) -> Bool {
    for column in 0..<boardSize {
      for row in 0..<boardSize {
        if fn(BoardLocation(row: row, column: column)) {
          return true
        }
      }
    }
    return false
  }

  
}