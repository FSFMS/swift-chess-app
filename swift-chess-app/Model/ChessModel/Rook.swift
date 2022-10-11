//
//  Rook.swift
//  swift-chess-app
//
//  Created by 김호종 on 2022/10/03.
//

import Foundation

struct Rook: ChessUnitProtocol {
    let type: ChessUnitType = .Rook
    static var point: Int = 5
    
    let playerFaction: PlayerFaction
    var icon: String { playerFaction == .Black ? "♜" : "♖" }
    
    init(_ playerFaction: PlayerFaction) { self.playerFaction = playerFaction }
    
    func movablePaths(_ currentChessPosition: ChessPosition) -> [ChessPosition] {
        return ChessUnitMovable.straight(currentChessPosition).flatMap { $0 }
    }
}
