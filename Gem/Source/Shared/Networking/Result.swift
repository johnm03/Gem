//
//  Result.swift
//  FruitViewer

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}
