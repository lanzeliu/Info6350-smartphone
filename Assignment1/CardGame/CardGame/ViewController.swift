//
//  ViewController.swift
//  CardGame
//
//  Created by Liu Lanze on 9/27/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var poker1: UIImageView!
    @IBOutlet weak var poker2: UIImageView!
    @IBOutlet weak var poker3: UIImageView!
    @IBOutlet weak var poker4: UIImageView!
    @IBOutlet weak var poker5: UIImageView!
    @IBOutlet weak var poker6: UIImageView!
    
    @IBOutlet weak var lblWinner: UILabel!
    
    let pokerCardNames: Array<String> = [
    "AC", "AD", "AH", "AS",
    "2C", "2D", "2H", "2S",
    "3C", "3D", "3H", "3S",
    "4C", "4D", "4H", "4S",
    "5C", "5D", "5H", "5S",
    "6C", "6D", "6H", "6S",
    "7C", "7D", "7H", "7S",
    "8C", "8D", "8H", "8S",
    "9C", "9D", "9H", "9S",
    "10C", "10D", "10H", "10S",
    "JC", "JD", "JH", "JS",
    "QC", "QD", "QH", "QS",
    "KC", "KD", "KH", "KS",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playFunction(_ sender: UIButton) {
        
        let cardArray: [Int] = cardDrawing()
        let whoGoesFirstArray: [Int] = whoGoesFirst()
        cardImageUpdate(cardArray: cardArray, whoGoesFirstArray: whoGoesFirstArray)
        winnerDetermine(cardArray: cardArray, whoGoesFirstArray: whoGoesFirstArray)
    }
    
    func cardDrawing() -> Array<Int> {
        var cardArray: [Int] = []
        while cardArray.count != 6 {
            let cardValue = Int.random(in: 0..<52)
            if (!cardArray.contains(cardValue)) {
                cardArray.append(cardValue)
            }
        }
        return cardArray
    }
    
    func whoGoesFirst() -> Array<Int> {
        let coin = Int.random(in: 0...1)
        if (coin == 0) {
            return [0, 1]
        }
        return [1, 0]
    }
    
    func cardImageUpdate(cardArray: Array<Int>, whoGoesFirstArray: Array<Int>) {
        let player1Index = whoGoesFirstArray[0]
        let player2Index = whoGoesFirstArray[1]
        
        poker1.image = UIImage(named: pokerCardNames[cardArray[player1Index]])
        poker2.image = UIImage(named: pokerCardNames[cardArray[player1Index + 2]])
        poker3.image = UIImage(named: pokerCardNames[cardArray[player1Index + 4]])
        
        poker4.image = UIImage(named: pokerCardNames[cardArray[player2Index]])
        poker5.image = UIImage(named: pokerCardNames[cardArray[player2Index + 2]])
        poker6.image = UIImage(named: pokerCardNames[cardArray[player2Index + 4]])
    }
    
    func winnerDetermine(cardArray: Array<Int>, whoGoesFirstArray: Array<Int>) {
        let player1Index = whoGoesFirstArray[0]
        let player2Index = whoGoesFirstArray[1]
        if (cardArray[player1Index] == 3 || cardArray[player1Index + 2] == 3 || cardArray[player1Index + 4] == 3) {
            lblWinner.text = "Play1 Wins!"
        } else if (cardArray[player2Index] == 3 || cardArray[player2Index + 2] == 3 || cardArray[player2Index + 4] == 3) {
            lblWinner.text = "Player2 Wins!"
        } else {
            lblWinner.text = "No Winner"
        }
    }
}

