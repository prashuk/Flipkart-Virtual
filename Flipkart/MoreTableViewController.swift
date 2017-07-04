//
//  MoreTableViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/28/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController, UISearchResultsUpdating {

    var moreItems = ["Books", "Musical Instruments", "Stationary", "Automotive"]
    var filteredMoreItems = [String]()
    
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
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 16/255, green: 123/255, blue: 213/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
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
            return moreItems.count
        }
        else {
            return filteredMoreItems.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "electronicCell", for: indexPath)
        //above line is not working in searching
        //var cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "electronicCell")
        var cell = UITableViewCell()
        
        if tableView == self.tableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath)
            cell.textLabel?.text = moreItems[indexPath.row]
        }
        else {
            //cell = tableView.dequeueReusableCell(withIdentifier: "electronicCell", for: indexPath)
            cell.textLabel?.text = filteredMoreItems[indexPath.row]
        }
        
        return cell
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredMoreItems = moreItems.filter
            {
                (more: String) -> Bool in
                if more.lowercased().contains(searchController.searchBar.text!.lowercased())
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
        if segue.identifier == "toMoreDetails"
        {
            let moreItemVC = segue.destination as! MoreItemViewController
            let indexPath : IndexPath = tableView.indexPathForSelectedRow!
            moreItemVC.itemName = moreItems[indexPath.row]
        }
    }
    
    @IBAction func backToMoreVC(segue:UIStoryboardSegue) {
    }

}
