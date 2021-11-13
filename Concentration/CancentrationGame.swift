import Foundation

class ConcentrationGame {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFacedUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberPairsOfCards: Int) {
        for _ in 1...numberPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        //TODO: Shuffle the cards
    }
}
