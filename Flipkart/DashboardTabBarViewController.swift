//
//  DashboardTabBarViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/24/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit

class DashboardTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.tabBar.barTintColor = UIColor(red: 26/255, green: 117/255, blue: 255/255, alpha: 1.0)
        self.tabBar.tintColor = UIColor.white

    }
    
    @IBAction func backToDashboardVC(segue:UIStoryboardSegue) {
    }

}
