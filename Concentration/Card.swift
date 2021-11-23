import Foundation

struct Card {
    var isFacedUp: Bool = false
    var isMatched: Bool = false
    var identifier: Int
    
    private static var identifierNumber: Int = 0
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
}
