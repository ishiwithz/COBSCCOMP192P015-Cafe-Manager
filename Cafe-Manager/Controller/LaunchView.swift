//
//  LaunchView.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-30.
//

import UIKit

class LaunchView: UIViewController {
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
