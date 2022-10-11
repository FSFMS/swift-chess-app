//
//  ChessUnitEnum.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

enum ChessUnitType: String, CaseIterable {
    case None = "."
    case Pawn = "Pawn"
    case Knight = "Night"
    case Bishop = "Bishop"
    case Rook = "Rook"
    case Queen = "Queen"
    case King = "King"
}
