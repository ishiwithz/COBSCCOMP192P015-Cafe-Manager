//
//  LoginViewController.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-30.
//

import UIKit
import Firebase
import Loaf

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     btnLogin.layer.cornerRadius = 25.0

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLoginpressed(_ sender: Any) {
        
        
        if !InputValidator.isValidateEmail(email: txtemail.text ?? ""){
            Loaf("Invalid Email", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidatePassword(pass: txtpassword.text ?? "" , minLenght: 6, maxLenght: 20){
            Loaf("Invalid Password", state: .error, sender: self).show()
            return
        }
        
        
        if let email = txtemail.text , !email.isEmpty, let password = txtpassword.text, !password.isEmpty
        {
        Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
            
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
                let objSession = SessionManager()
                
                objSession.saveLoginState()
                
                self.performSegue(withIdentifier: "linklogtoHome", sender: self)
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
