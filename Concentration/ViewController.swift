//
//  ViewController.swift
//  Concentration
//
//  Created by Евгений on 16/10/2018.
//  Copyright © 2018 Евгений. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countTouchLabel: UILabel!
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var countTouch = 0 {
        didSet {
            countTouchLabel.text = "Нажали: \(countTouch)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchCard(_ sender: UIButton) {
        countTouch += 1
        if let numberCard = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: numberCard)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🐵", "🐙", "🐶", "🐼", "🐬", "🐸", "🐥"]
    var emojies = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emojies[card.indentifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojies[card.indentifier] = emojiChoices.remove(at: randomIndex)
        }
        return emojies[card.indentifier] ?? "?"
    }

}

