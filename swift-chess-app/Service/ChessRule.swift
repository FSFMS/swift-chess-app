//
//  ChessRule.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

enum PlayerFaction: String, CaseIterable {
    case Black = "흑"
    case White = "백"
}

struct UnitRule {
    struct Count {
        static let pawnCount = 8
        static let bishopCount = 2
        static let knightCount = 2
        static let rookCount = 2
        static let queenCount = 1
        static let kingCount = 0
    }
    
    struct StartPosition {
        static func getChessPositions(chessUnitType: ChessUnitType, playerFaction: PlayerFaction) -> [ChessPosition] {
            switch chessUnitType {
            case .Pawn:
                return pawn(playerFaction)
            case .Knight:
                return knight(playerFaction)
            case .Bishop:
                return bishop(playerFaction)
            case .Rook:
                return rook(playerFaction)
            case .Queen:
                return queen(playerFaction)
            // TODO: King 추가 필요.
            default: return [ChessPosition]()
            }
            
        }
        /// 이 swift 파일은 룰에 관한 정의이므로 하드코딩을 할까, 논리적으로 풀까 고민을 조금 했습니다.
        /// 하지만 유닛(폰, 비숍, 룩, 나이트, 퀸, 킹)별로 일일히 하드코딩을 한다면 파일이 조금 지저분해질 까봐, 논리적으로 작성했습니다.
        static func pawn(_ playerFaction: PlayerFaction) -> [ChessPosition] {
            var chessPositions = [ChessPosition]()
            
            let file = playerFaction == .Black ? ChessPosition.File.Two : ChessPosition.File.Seven
            
            (0 ..< 8).forEach {
                if let position = ChessPosition(rank: $0, file: file.rawValue) {
                    chessPositions.append(position)
                }
            }
            
            return chessPositions
        }
        
        static func bishop(_ playerFaction: PlayerFaction) -> [ChessPosition] {
            var chessPositions = [ChessPosition]()
            
            let file = playerFaction == .Black ? ChessPosition.File.One : ChessPosition.File.Eight
            
            chessPositions.append(ChessPosition(rank: .C, file: file))
            chessPositions.append(ChessPosition(rank: .F, file: file))
            
            return chessPositions
        }
        
        static func rook(_ playerFaction: PlayerFaction) -> [ChessPosition] {
            var chessPositions = [ChessPosition]()
            
            let file = playerFaction == .Black ? ChessPosition.File.One : ChessPosition.File.Eight
            
            chessPositions.append(ChessPosition(rank: .A, file: file))
            chessPositions.append(ChessPosition(rank: .H, file: file))
            
            return chessPositions
        }
        
        static func knight(_ playerFaction: PlayerFaction) -> [ChessPosition] {
            var chessPositions = [ChessPosition]()
            
            let file = playerFaction == .Black ? ChessPosition.File.One : ChessPosition.File.Eight
            
            chessPositions.append(ChessPosition(rank: .B, file: file))
            chessPositions.append(ChessPosition(rank: .G, file: file))
            
            return chessPositions
        }
        
        static func queen(_ playerFaction: PlayerFaction) -> [ChessPosition] {
            let file = playerFaction == .Black ? ChessPosition.File.One : ChessPosition.File.Eight
            
            return [ChessPosition(rank: .E, file: file)]
        }
        
    }
}

struct ChessRule {
    static let boardSize = 8
}
