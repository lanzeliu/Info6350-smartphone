//
//  ViewController.swift
//  DiceGame
//
//  Created by Liu Lanze on 9/17/20.
//  Copyright © 2020 Liu Lanze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    @IBOutlet weak var lblScore: UILabel!
    
    var dice1Value: Int = -1
    var dice2Value = -1
    var diceSum = -1
    
    var totalScore = 0
    
    let imageNames = ["One", "Two", "Three", "Four", "Five", "Six"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //rollDices()
    }
    
    func rollDices() -> Int {
        let dice1Value = Int.random(in: 0..<6)
        let dice2Value = Int.random(in: 0..<6)
        
        //print(imageNames[val1])
        //print(imageNames[val2])
        
        dice1.image = UIImage(named: imageNames[dice1Value])
        dice2.image = UIImage(named: imageNames[dice2Value])
        
        return dice1Value + dice2Value + 2
    }

    
    @IBAction func resetAction(_ sender: UIButton) {
        diceSum = rollDices()
        totalScore = 0
        updateScore()
    }
    
    
    @IBAction func lessThanSevenPressed(_ sender: UIButton) {
        diceSum = rollDices()
        
        if (diceSum < 7) {
            totalScore += 1
        }
        updateScore()
        print(diceSum)
    }
    
    @IBAction func equalToSevenPressed(_ sender: UIButton) {
        diceSum = rollDices()
        
        if (diceSum == 7) {
            totalScore += 7
        }
        updateScore()
    }
    
    @IBAction func greaterThanSevenPressed(_ sender: UIButton) {
        diceSum = rollDices()
        
        if (diceSum > 7) {
            totalScore += 1
        }
        updateScore()
    }
    
    func updateScore() {
        lblScore.text = "Your score is equal to \(totalScore)"
    }
    //
}


