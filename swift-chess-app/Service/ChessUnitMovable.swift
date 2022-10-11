//
//  ChessUnitMovable.swift
//  swift-chess-app
//
//  Created by 김호종 on 2022/10/03.
//

import Foundation

/// 직선, 대각선을 위한 함수 모음
/// 영어의 한계로 인해.. 8방향을 표현하기 위에 상하좌우가 아닌.. 동서남북(북서북동등..)으로 표현 했습니다 ㅡ,ㅡ
/// 개발 하면서도 이게 맞는건가 싶은데.. 차주 미팅때 다른분들 의견을 좀 들어보겠습니다..
struct ChessUnitMovable {
    static func straight(_ currentPosition: ChessPosition) -> [[ChessPosition]] {
        var chessPositions = [[ChessPosition]]()

        // 북쪽(?!) 체크
        if let northFile = currentPosition.file - 1 {
            var northChessPositions = [ChessPosition]()
            for file in (ChessPosition.File.One ... northFile).reversed() {
                northChessPositions.append(ChessPosition(rank: currentPosition.rank, file: file))
            }
            
            chessPositions.append(northChessPositions)
        }
        
        // 남쪽 체크
        if let southFile = currentPosition.file + 1 {
            var southChessPositions = [ChessPosition]()
            for file in (southFile ... ChessPosition.File.Eight) {
                southChessPositions.append(ChessPosition(rank: currentPosition.rank, file: file))
            }
            
            chessPositions.append(southChessPositions)
        }
        
        // 서쪽 체크
        if let westRank = currentPosition.rank - 1 {
            var westChessPositions = [ChessPosition]()
            for rank in (ChessPosition.Rank.A ... westRank).reversed() {
                westChessPositions.append(ChessPosition(rank: rank, file: currentPosition.file))
            }
            
            chessPositions.append(westChessPositions)
        }
        
        // 동쪽 체크
        if let eastRank = currentPosition.rank + 1 {
            var eastChessPositions = [ChessPosition]()
            for rank in (eastRank ... ChessPosition.Rank.H) {
                eastChessPositions.append(ChessPosition(rank: rank, file: currentPosition.file))
            }
            
            chessPositions.append(eastChessPositions)
        }
        
        return chessPositions
    }
    
    static func diagonal(_ currentPosition: ChessPosition) -> [[ChessPosition]] {
        var chessPositions = [[ChessPosition]]()
        
        // 북서쪽 체크
        if var rank = currentPosition.rank - 1,
           var file = currentPosition.file - 1 {
            var northWestChessPositions = [ChessPosition]()
            while rank >= ChessPosition.Rank.A && file >= ChessPosition.File.One {
                northWestChessPositions.append(ChessPosition(rank: rank, file: file))
                
                if !rank.move(-1) || !file.move(-1) { break }
            }
            
            chessPositions.append(northWestChessPositions)
        }
        
        // 북동쪽 체크
        if var rank = currentPosition.rank + 1,
           var file = currentPosition.file - 1 {
            var northEastChessPositions = [ChessPosition]()
            while rank <= ChessPosition.Rank.H && file >= ChessPosition.File.One {
                northEastChessPositions.append(ChessPosition(rank: rank, file: file))
                
                if !rank.move(1) || !file.move(-1) { break }
            }
            
            chessPositions.append(northEastChessPositions)
        }
        
        // 남서쪽 체크
        if var rank = currentPosition.rank - 1,
           var file = currentPosition.file + 1 {
            var southWestChessPositions = [ChessPosition]()
            while rank >= ChessPosition.Rank.A && file <= ChessPosition.File.Eight {
                southWestChessPositions.append(ChessPosition(rank: rank, file: file))
                
                if !rank.move(-1) || !file.move(1) { break }
            }
            
            chessPositions.append(southWestChessPositions)
        }
 
        // 남동쪽 체크
        if var rank = currentPosition.rank + 1,
           var file = currentPosition.file + 1 {
            var southEastChessPositions = [ChessPosition]()
            while rank <= ChessPosition.Rank.H && file <= ChessPosition.File.Eight {
                southEastChessPositions.append(ChessPosition(rank: rank, file: file))
                
                if !rank.move(1) || !file.move(1) { break }
            }
            
            chessPositions.append(southEastChessPositions)
        }
        
        return chessPositions
    }
}
