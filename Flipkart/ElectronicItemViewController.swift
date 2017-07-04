//
//  ElectronicItemViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/24/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit

class ElectronicItemViewController: UIViewController {
    
    var itemName = ""
    var object = AddToCartViewController()
    var flag = 0
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var Open: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.title = itemName
        
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
    }

    @IBAction func addToCartBtnTapped(_ sender: Any) {
        object.addItemsInCart(itemAdd: itemName)
        let alert = UIAlertController(title: "Added to Cart", message: "Iten Name: " + itemName, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func menuBtnTapped(_ sender: Any) {
        self.navigationItem.rightBarButtonItem = self.backButton
    }
    @IBAction func backToItem(segue:UIStoryboardSegue) {
    }
}
