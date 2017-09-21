//
//  LifestyleTableViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/28/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit

class LifestyleTableViewController: UITableViewController, UISearchResultsUpdating {

    var lifestyleItems = ["Leans", "Pant", "Trouser", "Chinos", "Shirt", "T - Shirt", "Hoody", "Jacket", "Pullover", "Watch"]
    var filteredLifestyleItems = [String]()
    
    var searchController: UISearchController!
    var resultsController = UITableViewController()
    
    @IBOutlet weak var Open: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 26/255, green: 117/255, blue: 255/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return lifestyleItems.count
        }
        else {
            return filteredLifestyleItems.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "electronicCell", for: indexPath)
        //above line is not working in searching
        //var cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "electronicCell")
        var cell = UITableViewCell()
        
        if tableView == self.tableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "lifestyleCell", for: indexPath)
            cell.textLabel?.text = lifestyleItems[indexPath.row]
        }
        else {
            //cell = tableView.dequeueReusableCell(withIdentifier: "electronicCell", for: indexPath)
            cell.textLabel?.text = filteredLifestyleItems[indexPath.row]
        }
        
        return cell
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredLifestyleItems = lifestyleItems.filter
            {
                (lifestyle: String) -> Bool in
                if lifestyle.lowercased().contains(searchController.searchBar.text!.lowercased())
                {
                    return true
                }
                else
                {
                    return false
                }
        }
        resultsController.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLifestyleItem"
        {
            let lifestyleItemVC = segue.destination as! LifestyleItemViewController
            let indexPath : IndexPath = tableView.indexPathForSelectedRow!
            lifestyleItemVC.itemName = lifestyleItems[indexPath.row]
        }
    }
    
    @IBAction func backToLifestyleVC(segue:UIStoryboardSegue) {
    }

}
