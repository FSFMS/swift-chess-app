//
//  Knight.swift
//  swift-chess-app
//
//  Created by 김호종 on 2022/10/03.
//

import Foundation

struct Knight: ChessUnitProtocol {
    let type: ChessUnitType = .Knight
    static let point: Int = 3
    
    let playerFaction: PlayerFaction
    var icon: String { playerFaction == .Black ? "♞" : "♘" }
    
    init(_ playerFaction: PlayerFaction) {
        self.playerFaction = playerFaction
    }
    
    func movablePaths(_ currentChessPosition: ChessPosition) -> [ChessPosition] {
        var chessPositions = [ChessPosition]()
        
        let range = [ // 시계방향으로 범위 체크
            (-2, -1), (-2, 1), // 위
            (-1, 2), (1, 2), // 오른쪽
            (2, -1), (2, 1), // 아래
            (-1, -2), (1, -2) // 왼쪽
        ]
        
        for position in range {
            if let moveRank = currentChessPosition.rank + position.0,
               let moveFile = currentChessPosition.file + position.1 {
                chessPositions.append(ChessPosition(rank: moveRank, file: moveFile))
            }
        }
        
        return chessPositions
    }
}
