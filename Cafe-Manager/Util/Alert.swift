//
//  Alert.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-30.
//

import Foundation

class InputValidator{
    
    static func Alertpopup(msg: String){
        
        let dialogMessage = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        
    
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        
        
        dialogMessage.addAction(ok)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    
}

