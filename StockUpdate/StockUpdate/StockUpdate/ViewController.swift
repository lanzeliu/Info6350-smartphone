//
//  ViewController.swift
//  StockUpdate
//
//  Created by Liu Lanze on 10/1/20.
//

import UIKit
import Alamofire
import SwiftSpinner

class ViewController: UIViewController {

    let apiKey = "02fed0ab4538255cdeb73e106387cf75"
    let apiURL = "https://financialmodelingprep.com/api/v3/quote-short/"
    
    @IBOutlet weak var txtStockName: UITextField!
    
    @IBOutlet weak var lblStockValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getStockValue(_ sender: Any) {
        guard let stockName = txtStockName.text else { return }
        
        print(stockName)
        
        let url = "\(apiURL)\(stockName)?apikey=\(apiKey)"
        
        print(url)
        
        SwiftSpinner.show("Getting Stock Value for \(stockName)")
        
        Alamofire.request(url).responseJSON {
            (response) in
            print(response)
            SwiftSpinner.hide()
            
            
            
        }
    }
}
    


