//
//  ViewController.swift
//  TableViewExample
//
//  Created by Liu Lanze on 10/1/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    var arr = ["Seattle", "New York", "Las Vegas", "Portland"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cel.textLabel?.text = arr[indexPath.row]
        
        return cel
    }


}

