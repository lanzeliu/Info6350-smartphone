//
//  ViewController.swift
//  StockApp
//
//  Created by Liu Lanze on 11/5/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    let apiKey = "02fed0ab4538255cdeb73e106387cf75"
    let apiURL = "https://financialmodelingprep.com/api/v3/profile/"
    
    @IBOutlet weak var txtStockName: UITextField!
    @IBOutlet weak var lblCEOName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSymbolName: UILabel!
    @IBOutlet weak var lblPriceLabel: UILabel!
    @IBOutlet weak var lblCEOLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getValue(_ sender: Any) {
        guard let stockName = txtStockName.text else { return }
        
        let url = "\(apiURL)\(stockName)?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting Stock Value & CEO Name For \(stockName)")
        Alamofire.request(url).responseJSON { (response) in
            SwiftSpinner.hide()
            if response.result.isSuccess {
                guard let jsonString = response.result.value else { return }
                guard let stockJSON: [JSON] = JSON(jsonString).array else { return }
                
                if stockJSON.count < 1 { return }
                guard let ceo = stockJSON[0]["ceo"].rawString() else { return }
                guard let price = stockJSON[0]["price"].double else { return }
                
                self.lblPriceLabel.text = "\(price)"
                self.lblCEOLabel.text = "\(ceo)"
            }
        }
        
    }
    
}

