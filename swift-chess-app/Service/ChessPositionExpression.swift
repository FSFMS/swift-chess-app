//
//  ChessPositionExpression.swift
//  swift-chess-app
//
//  Created by 김호종 on 2022/10/08.
//

import Foundation

func +(lhs: ChessPosition.File, rhs: ChessPosition.File) -> ChessPosition.File? {
    ChessPosition.File(rawValue: lhs.rawValue + rhs.rawValue)
}

func -(lhs: ChessPosition.File, rhs: ChessPosition.File) -> ChessPosition.File? {
    ChessPosition.File(rawValue: lhs.rawValue - rhs.rawValue)
}

func +(lhs: ChessPosition.File, rhs: Int) -> ChessPosition.File? {
    ChessPosition.File(rawValue: lhs.rawValue + rhs)
}

func -(lhs: ChessPosition.File, rhs: Int) -> ChessPosition.File? {
    ChessPosition.File(rawValue: lhs.rawValue - rhs)
}

func ...(lhs: ChessPosition.File, rhs: ChessPosition.File) -> [ChessPosition.File] {
    var files = [ChessPosition.File]()
    if lhs < rhs {
        for i in (lhs.rawValue ... rhs.rawValue) {
            if let file = ChessPosition.File(rawValue: i) {
                files.append(file)
            }
        }
    }
        
    return files
}


func >(lhs: ChessPosition.File, rhs: ChessPosition.File) -> Bool {
    lhs.rawValue > rhs.rawValue
}

func >=(lhs: ChessPosition.File, rhs: ChessPosition.File) -> Bool {
    lhs.rawValue >= rhs.rawValue
}

func <(lhs: ChessPosition.File, rhs: ChessPosition.File) -> Bool {
    lhs.rawValue < rhs.rawValue
}

func <=(lhs: ChessPosition.File, rhs: ChessPosition.File) -> Bool {
    lhs.rawValue <= rhs.rawValue
}


func +(lhs: ChessPosition.Rank, rhs: ChessPosition.Rank) -> ChessPosition.Rank? {
    ChessPosition.Rank(rawValue: lhs.rawValue + rhs.rawValue)
}

func -(lhs: ChessPosition.Rank, rhs: ChessPosition.Rank) -> ChessPosition.Rank? {
    ChessPosition.Rank(rawValue: lhs.rawValue + rhs.rawValue)
}

func +(lhs: ChessPosition.Rank, rhs: Int) -> ChessPosition.Rank? {
    ChessPosition.Rank(rawValue: lhs.rawValue + rhs)
}

func -(lhs: ChessPosition.Rank, rhs: Int) -> ChessPosition.Rank? {
    ChessPosition.Rank(rawValue: lhs.rawValue - rhs)
}

func ...(lhs: ChessPosition.Rank, rhs: ChessPosition.Rank) -> [ChessPosition.Rank] {
    var ranks = [ChessPosition.Rank]()
    if lhs < rhs {
        for i in (lhs.rawValue ... rhs.rawValue) {
            if let rank = ChessPosition.Rank(rawValue: i) {
                ranks.append(rank)
            }
        }
    }
        
    return ranks
}

func >(lhs: ChessPosition.Rank, rhs: ChessPosition.Rank) -> Bool {
    lhs.rawValue > rhs.rawValue
}

func >=(lhs: ChessPosition.Rank, rhs: ChessPosition.Rank) -> Bool {
    lhs.rawValue >= rhs.rawValue
}

func <(lhs: ChessPosition.Rank, rhs: ChessPosition.Rank) -> Bool {
    lhs.rawValue < rhs.rawValue
}

func <=(lhs: ChessPosition.Rank, rhs: ChessPosition.Rank) -> Bool {
    lhs.rawValue <= rhs.rawValue
}

extension Array {
    subscript(rank: ChessPosition.Rank) -> Element {
        self[rank.rawValue]
    }
    subscript(file: ChessPosition.File) -> Element {
        self[file.rawValue]
    }
}
