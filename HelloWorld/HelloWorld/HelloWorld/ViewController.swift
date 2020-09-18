//
//  ViewController.swift
//  HelloWorld
//
//  Created by Liu Lanze on 9/10/20.
//  Copyright © 2020 Liu Lanze. All rights reserved.
//

import UIKit

class HelloWorldViewController: UIViewController {
    
    
    @IBOutlet weak var lblHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func sayHi(_ sender: UIButton) {
        lblHello.text = "Hello World"
    }
    
    
    
    
}

