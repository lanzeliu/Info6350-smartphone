//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Liu Lanze on 10/1/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "This is title", message: "This is message", preferredStyle: .alert)
        
        let OK = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK pressed")
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel pressed")
        }
        
        alert.addAction(cancel)
        alert.addAction(OK)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

