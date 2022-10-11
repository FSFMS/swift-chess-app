//
//  ChessMovableTest.swift
//  swift-chess-appTests
//
//  Created by 김호종 on 2022/10/08.
//

import XCTest
@testable import swift_chess_app

/// ChessUnitMovable을 테스트 하는 swift 파일
/// ChessUnitMovable은 다른 말이 있는지 구분하지 않는다.
/// 따라서, 보드의 범위가 유효한지, 유효한 위치인지만 확인한다.

final class ChessMovableTest: XCTestCase {
    func test_직선경로() {
        test_직선경로_1()
        test_직선경로_2()
        test_직선경로_3()
    }
    
    func test_직선경로_1() {
        let chessPosition = ChessPosition(rank: .A, file: .One)
        
        var exceptiedPaths = [ChessPosition]()
        
        for file in ChessPosition.File.Two ... ChessPosition.File.Eight {
            exceptiedPaths.append(ChessPosition(rank: chessPosition.rank, file: file))
        }
        
        for rank in ChessPosition.Rank.B ... ChessPosition.Rank.H {
            exceptiedPaths.append(ChessPosition(rank: rank, file: chessPosition.file))
        }
        
        let movablePaths = ChessUnitMovable.straight(chessPosition).flatMap { $0 }
        
        XCTAssertEqual(movablePaths, exceptiedPaths)
    }
    
    func test_직선경로_2() {
        let chessPosition = ChessPosition(rank: .H, file: .Eight)
        
        var exceptiedPaths = [ChessPosition]()
        
        for file in ChessPosition.File.One ... ChessPosition.File.Seven {
            exceptiedPaths.append(ChessPosition(rank: chessPosition.rank, file: file))
        }
        
        for rank in ChessPosition.Rank.A ... ChessPosition.Rank.G {
            exceptiedPaths.append(ChessPosition(rank: rank, file: chessPosition.file))
        }
        
        let movablePaths = ChessUnitMovable.straight(chessPosition).flatMap { $0 }
        
        exceptiedPaths = exceptiedPaths.filter { $0 != chessPosition }
        
        exceptiedPaths.forEach {
            XCTAssertTrue(movablePaths.contains($0))
        }
    }
    
    func test_직선경로_3() {
        let chessPosition = ChessPosition(rank: .D, file: .Four)
        
        var exceptiedPaths = [ChessPosition]()
        
        for file in ChessPosition.File.One ... ChessPosition.File.Eight {
            exceptiedPaths.append(ChessPosition(rank: chessPosition.rank, file: file))
        }
        
        for rank in ChessPosition.Rank.A ... ChessPosition.Rank.H {
            exceptiedPaths.append(ChessPosition(rank: rank, file: chessPosition.file))
        }
        
        let movablePaths = ChessUnitMovable.straight(chessPosition).flatMap { $0 }
        
        exceptiedPaths = exceptiedPaths.filter { $0 != chessPosition }
        
        exceptiedPaths.forEach {
            XCTAssertTrue(movablePaths.contains($0))
        }
        
    }
    
    func test_대각선경로() {
        test_대각선경로_1()
        test_대각선경로_2()
        test_대각선경로_3()
        test_대각선경로_4()
        test_대각선경로_5()
    }
    
    func test_대각선경로_1() {
        let chessPosition = ChessPosition(rank: .A, file: .One)
        
        let exceptiedPath: [ChessPosition] = [
            ChessPosition(rank: .B, file: .Two),
            ChessPosition(rank: .C, file: .Three),
            ChessPosition(rank: .D, file: .Four),
            ChessPosition(rank: .E, file: .Five),
            ChessPosition(rank: .F, file: .Six),
            ChessPosition(rank: .G, file: .Seven),
            ChessPosition(rank: .H, file: .Eight)
        ]
        
        let movablePaths = ChessUnitMovable.diagonal(chessPosition).flatMap { $0 }
        
        XCTAssertEqual(movablePaths, exceptiedPath)
    }
    
    func test_대각선경로_2() {
        let chessPosition = ChessPosition(rank: .H, file: .One)
        
        let exceptiedPath: [ChessPosition] = [
            ChessPosition(rank: .G, file: .Two),
            ChessPosition(rank: .F, file: .Three),
            ChessPosition(rank: .E, file: .Four),
            ChessPosition(rank: .D, file: .Five),
            ChessPosition(rank: .C, file: .Six),
            ChessPosition(rank: .B, file: .Seven),
            ChessPosition(rank: .A, file: .Eight)
        ]
        
        let movablePaths = ChessUnitMovable.diagonal(chessPosition).flatMap { $0 }
        
        XCTAssertEqual(movablePaths, exceptiedPath)
    }
    
    func test_대각선경로_3() {
        let chessPosition = ChessPosition(rank: .A, file: .Eight)
        
        let exceptiedPath: [ChessPosition] = [
            ChessPosition(rank: .B, file: .Seven),
            ChessPosition(rank: .C, file: .Six),
            ChessPosition(rank: .D, file: .Five),
            ChessPosition(rank: .E, file: .Four),
            ChessPosition(rank: .F, file: .Three),
            ChessPosition(rank: .G, file: .Two),
            ChessPosition(rank: .H, file: .One)
        ]
        
        let movablePaths = ChessUnitMovable.diagonal(chessPosition).flatMap { $0 }
        
        XCTAssertEqual(movablePaths, exceptiedPath)
    }
    
    func test_대각선경로_4() {
        let chessPosition = ChessPosition(rank: .H, file: .Eight)
        
        let exceptiedPath: [ChessPosition] = [
            ChessPosition(rank: .G, file: .Seven),
            ChessPosition(rank: .F, file: .Six),
            ChessPosition(rank: .E, file: .Five),
            ChessPosition(rank: .D, file: .Four),
            ChessPosition(rank: .C, file: .Three),
            ChessPosition(rank: .B, file: .Two),
            ChessPosition(rank: .A, file: .One)
        ]
        
        let movablePaths = ChessUnitMovable.diagonal(chessPosition).flatMap { $0 }
        
        XCTAssertEqual(movablePaths, exceptiedPath)
    }
    
    func test_대각선경로_5() {
        let chessPosition = ChessPosition(rank: .D, file: .Four)
        
        let exceptiedPath: [ChessPosition] = [
            ChessPosition(rank: .C, file: .Three),
            ChessPosition(rank: .B, file: .Two),
            ChessPosition(rank: .A, file: .One),
            ChessPosition(rank: .E, file: .Three),
            ChessPosition(rank: .F, file: .Two),
            ChessPosition(rank: .G, file: .One),
            ChessPosition(rank: .C, file: .Five),
            ChessPosition(rank: .B, file: .Six),
            ChessPosition(rank: .A, file: .Seven),
            ChessPosition(rank: .E, file: .Five),
            ChessPosition(rank: .F, file: .Six),
            ChessPosition(rank: .G, file: .Seven),
            ChessPosition(rank: .H, file: .Eight)
        ]
        
        let movablePaths = ChessUnitMovable.diagonal(chessPosition).flatMap { $0 }
        
        XCTAssertEqual(movablePaths, exceptiedPath)
    }
}
