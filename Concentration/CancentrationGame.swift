import Foundation

class ConcentrationGame {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFacedUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFacedUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFacedUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            } else {
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberPairsOfCards: Int) {
        assert(numberPairsOfCards > 0, "ConcentrationGame.init\(numberPairsOfCards): must have at least one pair of cards")
        for _ in 1...numberPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        //TODO: Shuffle the cards
    }
}
