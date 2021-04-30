//
//  ForgetPasswordViewController.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-30.
//

import UIKit
import Firebase

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnupdatepressed(_ sender: Any) {
        
        if let email = txtEmail.text , !email.isEmpty{
            
            Auth.auth().sendPasswordReset(withEmail: email) { error in
              
                if let e = error {
                    
                    
                    let dialogMessage = UIAlertController(title: "Alert", message: e.localizedDescription, preferredStyle: .alert)
                    
                
                    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                        print("Ok button tapped")
                     })
                    
                    
                    dialogMessage.addAction(ok)
                    
                    self.present(dialogMessage, animated: true, completion: nil)
                    
                    print(e.localizedDescription)
                }
                
                else
                {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                           let vc = storyboard.instantiateViewController(identifier: "Login" )
                           vc.modalPresentationStyle = .overFullScreen
                    self.present(vc, animated: true)
                }
                
            }
            
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
