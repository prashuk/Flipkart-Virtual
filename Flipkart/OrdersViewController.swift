//
//  OrdersViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/25/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit

var ordersItems = [String: [String]]()

struct Objects {
    
    var sectionName : String!
    var sectionObjects : [String]!

}
var objectArray = [Objects]()

class OrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var Open: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 26/255, green: 117/255, blue: 255/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white

        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        tableView.tableFooterView = UIView()
        
    }
    
    func addOrder(orderNumber: String, orderDetail: [String]) {
        objectArray.append(Objects(sectionName: orderNumber, sectionObjects: orderDetail))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
        cell.textLabel?.text = objectArray[indexPath.row].sectionName
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderDetails"
        {
            let orderItemVC = segue.destination as! OrderDetailsViewController
            let indexPath : IndexPath = tableView.indexPathForSelectedRow!
            orderItemVC.itemName = objectArray[indexPath.row].sectionObjects
            orderItemVC.orderNumber = objectArray[indexPath.row].sectionName
        }
    }

}
