//
//  HomeTableViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/28/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, UISearchResultsUpdating {

    var HomeItems = ["Table", "Chair", "Flower", "Dinning Table", "Bedsheet", "Pillow", "Curtain"]
    var filteredHomeItems = [String]()
    
    var searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var Open: UIBarButtonItem!
    
    
    //--Views Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 26/255, green: 117/255, blue: 255/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    
    //--TableView Functions
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredHomeItems.count
        }
        return HomeItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath)
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.textLabel?.text = filteredHomeItems[indexPath.row]
        }
        else {
            cell.textLabel?.text = HomeItems[indexPath.row]
        }
        return cell
    }
    
    
    //--Searching Functions
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredHomeItems = HomeItems.filter { item in
            return item.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    @IBAction func searchBtnTapped(_ sender: Any) {
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    
    //--Segue Functions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHomeDetails"
        {
            let homeItemVC = segue.destination as! HomeItemViewController
            let indexPath : IndexPath = tableView.indexPathForSelectedRow!
            if searchController.isActive && searchController.searchBar.text != "" {
                homeItemVC.itemName = filteredHomeItems[indexPath.row]
            }
            else {
                homeItemVC.itemName = HomeItems[indexPath.row]
            }
            
        }
    }
    
    
    //--Back to View Function
    
    @IBAction func backToHomeVC(segue:UIStoryboardSegue) {
        
    }
}
