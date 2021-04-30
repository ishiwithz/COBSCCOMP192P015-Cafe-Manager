//
//  EntityModel.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-30.
//

import Foundation

struct User {
    var userEmail: String
    var userPassword: String
    var userPhone: String
}


struct FoodItem {
    
    var Active : Bool
    var Description : String
    var Discount : Double
    var Name : String
    var Price : Double
    var Image : String
    
}

struct FoodCategory {
    
    var ID : String
    var Name : String
    
}
