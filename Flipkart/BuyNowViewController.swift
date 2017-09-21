//
//  BuyNowViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/24/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit
var count = 0
class BuyNowViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var items = [String]()
    
    var orderBuy = ""
    var payment = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var payButton: UIButton!
    
    var objectForAddToCartVC = AddToCartViewController()
    var objectForOrdersVC = OrdersViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payment = ["Credit Card", "Debit Card", "Ney Banking", "Cash/Card on Delivery", "Mobile Wallet", "Mobile"]
        
        if orderBuy == ""
        {
            payButton.setTitle("Proceed to Pay Rs." + String(items.count*100), for: .normal)
        }
        else
        {
            payButton.setTitle("Proceed to Pay Rs." + String(100), for: .normal)

        }
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 26/255, green: 117/255, blue: 255/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payment.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "payment", for: indexPath)
        cell.textLabel?.text = payment[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            
        }
    }
    
    @IBAction func payBtnPressed(_ sender: Any) {
        objectForAddToCartVC.emptyCart()
        count = count + 1
        objectForOrdersVC.addOrder(orderNumber: ("Order " + String(count)), orderDetail: items)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToSummary"
        {
            let summaryItemVC = segue.destination as! SummaryViewController
            summaryItemVC.lableName = "Order " + String(count)
        }
    }
}
