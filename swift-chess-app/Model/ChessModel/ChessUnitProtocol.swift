//
//  ChessUnitProtocol.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

protocol ChessUnitProtocol {
    var type: ChessUnitType { get }
    var playerFaction: PlayerFaction { get }
    func movablePaths(_ currentChessPosition: ChessPosition, _ board: [[ChessUnitProtocol?]]) -> [ChessPosition]
}
