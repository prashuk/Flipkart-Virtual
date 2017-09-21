//
//  LoginLogoutViewController.swift
//  Flipkart
//
//  Created by CTS BTP5NE18 on 11/28/16.
//  Copyright © 2016 Prashuk. All rights reserved.
//

import UIKit

class LoginLogoutViewController: UIViewController {

    let object = BackTableVC()
    
    @IBOutlet weak var Open: UIBarButtonItem!
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor(red: 26/255, green: 117/255, blue: 255/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if username.text == "prashuk" && password.text == "1234"
        {
            performSegue(withIdentifier: "toHome", sender: self)
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Username/Password Wrong", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHome"
        {
            object.data(user: username.text!)
        }
    }

}
