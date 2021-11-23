import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationGame(numberPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (buttonCollection.count + 1) / 2
        
    }
    
    var emojiCollectiion = ["🦔", "🐓", "🐖", "🦄", "🦑", "🦉", "🐗", "🦂", "🐋", "🦫", "🐩", "🐢", "🐊"]
    var emojiDictionary = [Int:String]()
    
    var touches: Int = 0 {
        didSet { //property observer
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollectiion.count)))
            emojiDictionary[card.identifier] = emojiCollectiion.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
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
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
}

