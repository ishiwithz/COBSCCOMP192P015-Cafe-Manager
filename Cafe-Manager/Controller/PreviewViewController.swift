//
//  PreviewViewController.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-30.
//

import UIKit
import Firebase

class PreviewViewController: UIViewController {

    
    @IBOutlet weak var PreviewTable: UITableView!
    
    var ref: DatabaseReference!
    
    var Foodcategories : [FoodCategory] = []
    var FoodItems : [FoodItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PreviewTable.register(UINib(nibName: "PreViewTableViewCell", bundle: nil), forCellReuseIdentifier: "PreviewCellIdentifier")
                
                ref = Database.database().reference()
                getFoodItemData()
    }
    
}




extension PreviewViewController {
    func getFoodItemData() {
        ref.child("FoodItems").observe(.value) { (snapshot) in
            
            if let data = snapshot.value as? [String : Any] {
                
                for categorykeys in data {
                    
                    self.Foodcategories.append(FoodCategory(ID: "",Name: categorykeys.key ))
                }
                
                for category in data {
                    
                   //self.Foodcategories.append(FoodCategory(Name: category.key ))
                    
                    if let items = category.value as? [String : Any] {
                        
                        for Singleitem in items {
                            
                            
                            if let iteminfo = Singleitem.value as? [String : Any]{
                                
                                
                                    self.FoodItems.append(FoodItem(
                                                                Active: iteminfo["Active"] as! Bool,
                                                                Description: iteminfo["Description"] as!  String,
                                                                Discount: iteminfo["Discount"] as! Double,
                                                                Name: iteminfo["Name"] as!  String,
                                                                Price: iteminfo["Price"] as!  Double,
                                                                Image: iteminfo["Image"] as! String))
                            
                            }
                        }
                        
                    }
                    
                    
                    
                }
                
                self.PreviewTable.reloadData()
                   
                
            }
        }
    }
}



extension PreviewViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //Foodcategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PreviewTable.dequeueReusableCell(withIdentifier: "PreviewCellIdentifier", for: indexPath) as! PreViewTableViewCell
        
        //cell.textLabel?.text = Foodcategories[indexPath.section].Name
        
        cell.setupView(foodItem: FoodItems[indexPath.row])
        
        return cell
    }
}

