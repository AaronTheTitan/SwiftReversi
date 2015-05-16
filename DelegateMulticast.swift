//
//  DelegateMulticast.swift
//  SwiftReversi
//
//  Created by Aaron Bradley on 5/15/15.
//  Copyright (c) 2015 razeware. All rights reserved.
//

import Foundation

class DelegateMulticast<T> {

  private var delegates = [T]()

  func addDelegate(delegate: T) {
    delegates.append(delegate)
  }

  func invokeDelegates(invocation: (T) -> ()) {
    for delegate in delegates {
      invocation(delegate)
    }
  }
}