//
//  Pawn.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

struct Pawn: ChessUnitProtocol {
    let type: ChessUnitType = .Pawn
    static var point: Int = 1
    let playerFaction: PlayerFaction
    var icon: String { playerFaction == .Black ? "♟" : "♙" }
    
    init(_ playerFaction: PlayerFaction) {
        self.playerFaction = playerFaction
    }
    
    func movablePaths(_ currentChessPosition: ChessPosition) -> [ChessPosition] {
        // Pawn은 앞좌우 세 방향 가능
        
        var movablePaths = [ChessPosition]()
        
        // 앞 체크
        // 앞은 진영에 따라 달라지므로, 두개 다 체크.
        if let moveFile = currentChessPosition.file + (playerFaction == .Black ? 1 : -1) {
            movablePaths.append(ChessPosition(rank: currentChessPosition.rank, file: moveFile))
        }
        
        // 좌우 체크
        if let moveRank = currentChessPosition.rank - 1 {
            movablePaths.append(ChessPosition(rank: moveRank, file: currentChessPosition.file))
        }
        
        if let moveRank = currentChessPosition.rank + 1 {
            movablePaths.append(ChessPosition(rank: moveRank, file: currentChessPosition.file))
        }
        
        return movablePaths
    }
}
