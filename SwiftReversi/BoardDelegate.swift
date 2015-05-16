//
//  BoardDelegate.swift
//  SwiftReversi
//
//  Created by Aaron Bradley on 5/15/15.
//  Copyright (c) 2015 razeware. All rights reserved.
//

import Foundation

protocol BoardDelegate {
  func cellStateChanged(location: BoardLocation)
}