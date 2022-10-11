//
//  ChessPosition.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/27.
//

import Foundation

struct ChessPosition: Equatable {
    enum Rank: Int {
        case A = 0
        case B = 1
        case C = 2
        case D = 3
        case E = 4
        case F = 5
        case G = 6
        case H = 7
    }
    
    enum File: Int, Equatable {
        case One = 0
        case Two = 1
        case Three = 2
        case Four = 3
        case Five = 4
        case Six = 5
        case Seven = 6
        case Eight = 7
    }
    
    let rank: Rank
    let file: File
    
    var positionString: String {
        // 유니코드 변환의 경우는 아직 실패할 가능성을 못봤기 때문에, fatalError로 남겨두겠습니다.
        guard let unicode = UnicodeScalar(asciiA + file.rawValue) else { fatalError("ChessPosition 변환 오류 \(file) \(rank)") }
        return "\(Character(unicode))\(rank.rawValue + 1)"
    }
    
    public init(rank: Rank, file: File) {
        self.rank = rank
        self.file = file
    }
    
    public init?(rank rankInt: Int, file fileInt: Int) {
        guard let rank = Rank(rawValue: rankInt),
              let file = File(rawValue: fileInt) else {
            return nil
        }
        self.rank = rank
        self.file = file
    }
    
    public init?(_ chessPositionString: String) { // String Command로 인한 생성에 실패할 경우 fatalError가 아닌, nil로 반환. Optional을 활용.
        let arr = Array(chessPositionString.uppercased())
        guard let rankInt = arr[1].wholeNumberValue,
              let fileAscii = arr[0].asciiValue,
              let rank = Rank(rawValue: rankInt),
              let file = File(rawValue: Int(fileAscii) - asciiA)
        else { return nil }
        
        self.rank = rank
        self.file = file
    }
    
    static func validate(rank: Int, file: Int) -> Bool {
        (0 ... 7).contains(rank) && (0 ... 7).contains(file)
    }
    
    // TODO: ChessPosition을 비교하는 함수들 수정 필요.
    // 현재는 입력이 String Command 형식이라 이렇게 구현을 했는데..
    // 추후에 핵심 로직을 넘어 App을 개발하게 되면 어떤식으로 입력을 할것인가에 대한 정의와 정리가 필요함.
    // 그때 반드시..!
    public static func ==(lhs: ChessPosition, rhs: ChessPosition) -> Bool {
        lhs.rank == rhs.rank && lhs.file == rhs.file
    }
    
    public static func ==(lhs: ChessPosition, rhs: String) -> Bool {
        guard let chessPosition = ChessPosition(rhs) else { return false }
        
        return lhs.rank == chessPosition.rank && lhs.file == chessPosition.file
    }
    
    public static func ==(lhs: String, rhs: ChessPosition) -> Bool {
        guard let chessPosition = ChessPosition(lhs) else { return false }
        
        return chessPosition.rank == rhs.rank && chessPosition.file == rhs.file
    }
}

extension ChessPosition.Rank {
    mutating func move(_ distance: Int) -> Bool {
        if self + distance == nil {
            return false
        } else {
            self = (self + distance)!
            return true
        }
    }
}

extension ChessPosition.File {
    mutating func move(_ distance: Int) -> Bool {
        if self + distance == nil {
            return false
        } else {
            self = (self + distance)!
            return true
        }
    }
}
