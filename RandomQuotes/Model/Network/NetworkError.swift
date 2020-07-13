//
//  FavCell.swift
//  RandomQuotes
//
//  Created by بدور on 13/07/2020.
//  Copyright © 2020 Bdour. All rights reserved.
//
import Foundation

//
// MARK: - Network Error
//
enum NetworkError: Error {
  //
  // MARK: - Cases
  //
  case dateParseError
  case invalidPath
  case parseError
  case requestError
}
