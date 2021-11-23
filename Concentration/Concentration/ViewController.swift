import UIKit

class ViewController: UIViewController {
    private var emojiCollectiion = ["🦔", "🐓", "🐖", "🦄", "🦑", "🦉", "🐗", "🦂", "🐋", "🦫", "🐩", "🐢", "🐊"]
    private var emojiDictionary = [Int:String]()
    
    private lazy var game = ConcentrationGame(numberPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (buttonCollection.count + 1) / 2
        
    }
    
    private(set) var touches: Int = 0 {
        didSet { //property observer
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            emojiDictionary[card.identifier] = emojiCollectiion.remove(at: emojiCollectiion.count.arc4randomExtension)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                //button.backgroundColor = UIColor.systemBlue
                button.backgroundColor = card.isMatched ? UIColor.white : UIColor.systemBlue
            }
        }
    }
    
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private weak var touchLabel: UILabel!
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
}


extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        return 0
    }
}

