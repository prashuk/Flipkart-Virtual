//
//  AddToCartViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/24/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit

var cartItems = [String]()

class AddToCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var totalNumberOfItems: UILabel!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var noItemsView: UIView!
    
    var flag = 0
    let flag2 = Dictionary<Int;:String, Any>()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 26/255, green: 117/255, blue: 255/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        
        noItemsView.isHidden = true
        
        if cartItems.count == 0
        {
            noItemsView.isHidden = false
            continueBtn.isEnabled = false
            continueBtn.setTitleColor(UIColor.gray, for: .normal)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if cartItems.count == 0
        {
            noItemsView.isHidden = false
            continueBtn.isEnabled = false
            continueBtn.setTitleColor(UIColor.gray, for: .normal)
        }
        totalNumberOfItems.text = "Total Items: " + String(cartItems.count)
        totalCost.text = "Total Amount: ₹" + String(cartItems.count * 100)
    }
    
    func addItemsInCart(itemAdd: String) {
        for item in cartItems {
            if item == itemAdd
            {
                flag = 1
                break
            }
        }
        if flag == 0
        {
            cartItems.append(itemAdd)
        }
    }
    
    func emptyCart() {
        cartItems = []
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath)
        cell.textLabel?.text = cartItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            cartItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
        if cartItems.count == 0
        {
            noItemsView.isHidden = false
            continueBtn.isEnabled = false
            continueBtn.setTitleColor(UIColor.gray, for: .normal)
            
        }
        totalNumberOfItems.text = "Total Items: " + String(cartItems.count)
        totalCost.text = "Total Amount: ₹" + String(cartItems.count * 100)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let buyVC = segue.destination as! BuyNowViewController
        buyVC.items = cartItems
    }
    
}
