//
//  SummaryViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/28/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var Open: UIBarButtonItem!
    @IBOutlet weak var orderNumberDisplay: UILabel!
    var lableName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        orderNumberDisplay.text = "Your " + lableName + " has been successfully placed."
    }

}
