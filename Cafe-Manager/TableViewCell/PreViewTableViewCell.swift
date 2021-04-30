//
//  PreViewTableViewCell.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-30.
//

import UIKit
import Kingfisher

class PreViewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var Foodimg: UIImageView!
    @IBOutlet weak var Foodname: UILabel!
    @IBOutlet weak var Fooddiscription: UILabel!
    
    @IBOutlet weak var Foodprice: UILabel!
    
    @IBOutlet weak var Fooddiscount: UILabel!
    @IBOutlet weak var Fooddicou: UIView!
    
    @IBOutlet weak var Foodactive: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func setupView(foodItem: FoodItem){
        
        Foodname.text = foodItem.Name
        Fooddiscription.text = foodItem.Description
        Foodprice.text = "LKR \(foodItem.Price)"
        Foodimg.kf.setImage(with: URL(string: foodItem.Image))
        
        if foodItem.Discount > 0 {
            Fooddicou.isHidden = false
            Fooddiscount.text = "\(foodItem.Discount)%"
        }else {
            Fooddicou.isHidden = true
            Fooddiscount.text = ""
        }
    }
    
}
