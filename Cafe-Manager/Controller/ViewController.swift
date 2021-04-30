//
//  ViewController.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-29.
//

import UIKit

class ViewController: UIViewController {
    
    let objSession = SessionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
       
        if objSession.getLoginState() {
            
            self.performSegue(withIdentifier: "LinktoHome", sender: nil)
        }
        else{
            
            self.performSegue(withIdentifier: "LinktoLogin", sender: nil)
            
        }
    }
    
}

