//
//  ViewController.swift
//  TicTacToe
//
//  Created by Liu Lanze on 9/17/20.
//  Copyright © 2020 Liu Lanze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets for Buttons
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    
    // Outlets for Labels
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTurn: UILabel!
    
    var arrButtons: [UIButton]?
    var buttonValue = Array(repeating: Array(repeating: 0, count: 3), count: 3)
    var result = false
    var turn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }
    
    func initialize() {
        arrButtons = [zero, one, two, three, four, five, six, seven, eight]
        
        for button in arrButtons! {
            button.setTitle("", for: .normal)
        }
        
        result = false
        turn = true
        buttonValue = Array(repeating: Array(repeating: 0, count: 3), count: 3)
        lblResult.text = ""
        
    }

    @IBAction func stepButtonPressed(_ sender: UIButton) {
        //print(sender.tag)
        
        guard let arrButtons = arrButtons else {return}
        
        if (!result) {
            if (sender.title(for: .normal) == "") {
                if (turn == true) {
                    arrButtons[sender.tag].setTitle("X", for: .normal)
                    lblTurn.text = "O's Turn"
                    buttonValue[sender.tag / buttonValue.count][sender.tag % buttonValue.count] = -1
                } else {
                    arrButtons[sender.tag].setTitle("O", for: .normal)
                    lblTurn.text = "X's Turn"
                    buttonValue[sender.tag / buttonValue.count][sender.tag % buttonValue.count] = 1
                }
                checkResult()
                turn = !turn
            }
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        initialize()
    }
    
    
    func checkResult() {
        // Check row
        var oCount = 0
        var xCount = 0
        if (!result) {
            for i in 0..<buttonValue.count {
                xCount = 0
                oCount = 0
                for j in 0..<buttonValue[0].count {
                    if (buttonValue[i][j] == -1) {
                        xCount += 1
                    }
                    else if (buttonValue[i][j] == 1) {
                        oCount += 1
                    }
                }
                if (xCount == 3 || oCount == 3) {
                    result = true
                }
            }
        }
        // Check column
        if (!result) {
            for i in 0..<buttonValue[0].count {
                xCount = 0
                oCount = 0
                for j in 0..<buttonValue.count {
                    if (buttonValue[j][i] == -1) {
                        xCount += 1
                    }
                    else if (buttonValue[j][i] == 1) {
                        oCount += 1
                    }
                }
                if (xCount == 3 || oCount == 3) {
                    result = true
                }
            }
        }
            
        // Check diagonal
        if (!result) {
            xCount = 0
            oCount = 0
            for i in 0..<buttonValue.count {
                if (buttonValue[i][i] == -1) {
                    xCount += 1
                }
                else if (buttonValue[i][i] == 1) {
                    oCount += 1
                }
            }
            if (xCount == 3 || oCount == 3) {
                result = true
            }
        }
        
        // Check anti-diagonal
        if (!result) {
            xCount = 0
            oCount = 0
            for i in 0..<buttonValue.count {
                if (buttonValue[i][buttonValue.count - i - 1] == -1) {
                    xCount += 1
                }
                else if (buttonValue[i][buttonValue.count - i - 1] == 1) {
                    oCount += 1
                }
            }
            if (xCount == 3 || oCount == 3) {
                result = true
            }
        }
        
        if (result) {
            if (oCount == 3) {
                lblResult.text = "O win!"
            }
            else if (xCount == 3) {
                lblResult.text = "X win!"
            }
        }
    }
}

