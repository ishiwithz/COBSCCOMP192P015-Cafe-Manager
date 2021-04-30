//
//  CategoryViewController.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-30.
//

import UIKit
import Firebase
import Loaf

class CategoryViewController: UIViewController {

    @IBOutlet weak var btnadd_category: UIButton!
    
    @IBOutlet weak var Categorytableview: UITableView!
    
    @IBOutlet weak var txtCategory: UITextField!
    
    let ref = Database.database().reference()
    
    var Foodcategories : [FoodCategory] = []
    
    //let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        btnadd_category.layer.cornerRadius = 25.0
        
        Categorytableview.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryCellIdentifier")
                
        getcategoryData()
        
        
    }

    @IBAction func btnAdd_clicked(_ sender: UIButton) {
        
        
        if let name = txtCategory.text {
            
            //let randomInt = Int.random(in: 1..<10000)
            
            ref.child("Category").childByAutoId().setValue(["Name": name])
            {
                (error, ref) in
                
                if let err = error{
                    print(err.localizedDescription)
                    Loaf("Data save failed!", state: .error, sender: self).show()
                }
                
                Loaf("Data save successfully!", state: .success, sender: self).show()
                
                self.txtCategory.text = "";
                
                self.getcategoryData()
                
                
            }
            
        } else {
            
            Loaf("Enter a category name", state: .error, sender: self).show()
        }
        
        
        
        
        
    }
    
}

extension CategoryViewController {
    
    func getcategoryData() {
   
        self.Foodcategories.removeAll();
        
        ref.child("Category").observe(.value) { (snapshot) in
            
            if let data = snapshot.value as? [String : Any] {
                
                for category in data {
                                        
                    if let catinfo = category.value as? [String : Any]{
                        
                        self.Foodcategories.append(FoodCategory(ID : category.key,Name: catinfo["Name"] as! String))
                        
                        print(self.Foodcategories)
                        
                    }
                }
                
                
                self.Categorytableview.reloadData()
                
    }
        }
        
        
        
}
        
    }

extension CategoryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Foodcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Categorytableview.dequeueReusableCell(withIdentifier: "CategoryCellIdentifier", for: indexPath) as! CategoryTableViewCell
        
        cell.selectionStyle = .none
        cell.setupView(foodCategory: self.Foodcategories[indexPath.row])
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
            self.deleteCategory(id: self.Foodcategories[indexPath.row])
            
        }
    }
    
    func deleteCategory(id: FoodCategory ){
        
        ref.child("Catagory")
            .child(id.ID)
            .removeValue() {
                error, ref in
                if error != nil {
                    Loaf("Could not remove category", state: .error, sender: self).show()
                } else {
                    Loaf("Category Removed", state: .success, sender: self).show()
                    self.getcategoryData()
                }
            }
        
            
    }

}


