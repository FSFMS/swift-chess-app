//
//  Queen.swift
//  swift-chess-app
//
//  Created by 김호종 on 2022/10/03.
//

import Foundation

struct Queen: ChessUnitProtocol {
    let type: ChessUnitType = .Bishop
    static let point: Int = 8
    
    let playerFaction: PlayerFaction
    var icon: String { playerFaction == .Black ? "♛" : "♕" }
    
    init(_ playerFaction: PlayerFaction) { self.playerFaction = playerFaction }
    
    func movablePaths(_ currentChessPosition: ChessPosition) -> [ChessPosition] {
        return ChessUnitMovable.diagonal(currentChessPosition).flatMap { $0 } + ChessUnitMovable.straight(currentChessPosition).flatMap { $0 }
    }
}
