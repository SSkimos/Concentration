//
//  ViewController.swift
//  Concentration
//
//  Created by Никита Черешнев on 13.11.2021.
//

import UIKit

class ViewController: UIViewController {
    var touches: Int = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.systemBlue
        } else {
            button.setTitle(emoji, for: .normal)
            button.titleLabel!.font = UIFont(name: "Times New Roman", size: 50)
            button.backgroundColor = UIColor.white
        }
    }
    
    let emojiCollectiion = ["🦔", "🐓", "🦔", "🐓"]
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            flipButton(emoji: emojiCollectiion[buttonIndex], button: sender)
        }
    }
}

