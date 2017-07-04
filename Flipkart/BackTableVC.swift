//
//  BackTableVC.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/25/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController, UIPopoverPresentationControllerDelegate {
    
    var slideCell = [String]()
    
    override func viewDidLoad() {

        data(user: "Login")
        tableView.tableFooterView = UIView()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func data(user: String)
    {
        slideCell = [user, "Home", "My Account", "My Orders", "Logout", "Calendar"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return slideCell.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: slideCell[indexPath.row], for: indexPath) as UITableViewCell
        cell.textLabel?.text = slideCell[indexPath.row]
        return cell
    }
    
//    @IBAction func popOver(_ sender: Any) {
//        performSegue(withIdentifier: "showView", sender: self)
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if (segue.identifier == "showView")
//        {
//            let vc = segue.destination as UIViewController
//            let controller = vc.popoverPresentationController
//            if controller != nil
//            {
//                controller?.delegate = self
//            }
//        }
//        
//    }
    
    
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//        return .none
//    }
}
