//
//  BoardCellState.swift
//  SwiftReversi
//
//  Created by Aaron Bradley on 5/15/15.
//  Copyright (c) 2015 razeware. All rights reserved.
//

import Foundation

enum BoardCellState {
  case Empty, Black, White

  func invert() -> BoardCellState {
    if self == Black {
      return White
    } else if self == White {
      return Black
    }

    assert(self != Empty, "cannot invert the empty state")
    return Empty
  }
}
