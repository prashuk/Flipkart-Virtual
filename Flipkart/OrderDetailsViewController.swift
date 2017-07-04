//
//  OrderDetailsViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 12/6/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit

class OrderDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var itemName = [String]()
    var data = [String]()
    var orderNumber = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = orderNumber
        data = itemName
        
        tableView.tableFooterView = UIView()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderDetails", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
}
