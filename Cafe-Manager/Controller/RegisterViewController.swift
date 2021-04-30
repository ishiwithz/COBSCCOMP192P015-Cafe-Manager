//
//  RegisterViewController.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-30.
//

import UIKit
import Firebase
import Loaf

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func btn_Registerpressed(_ sender: UIButton) {
        
        
        if !InputValidator.isValidateEmail(email: txtEmail.text ?? ""){
            Loaf("Invalid Email", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidateMobileNo(txtPhone.text ?? ""){
            Loaf("Invalid Phone No", state: .error, sender: self).show()
            return
        }
        
        if !InputValidator.isValidatePassword(pass: txtPassword.text ?? "" , minLenght: 6, maxLenght: 20){
            Loaf("Invalid Password - Password should have 6 - 20 length", state: .error, sender: self).show()
            return
        }
        
        
        if let email = txtEmail.text , !email.isEmpty, let password = txtPassword.text, !password.isEmpty,let phone = txtPhone.text,!phone.isEmpty
        {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
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
                    
                    let user = User(userEmail: self.txtEmail.text ?? "", userPassword: self.txtPassword.text ?? "" , userPhone: self.txtPhone.text ?? "")
                    
                    self.saveUserData(user: user)
                    
                    let objSession = SessionManager()
                    
                    objSession.saveLoginState()
                    
                    self.performSegue(withIdentifier: "LinkregtoHome", sender: self)
                }
              
            }
        }
        
    }
    
    func saveUserData(user: User){
        let randomInt = Int.random(in: 1..<10000)
        let userData = [
            "UserEmail" : user.userEmail,
            "UserPhone" : user.userPhone,
            "UserPassword" : user.userPassword]
        
        self.ref.child("Users").child("\(randomInt)").setValue(userData)
        {
            (error, ref) in
            
            if let e = error {
                
                
                let dialogMessage = UIAlertController(title: "Alert", message: e.localizedDescription, preferredStyle: .alert)
                
            
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("Ok button tapped")
                 })
                
                
                dialogMessage.addAction(ok)
                
                self.present(dialogMessage, animated: true, completion: nil)
                
                print(e.localizedDescription)
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
