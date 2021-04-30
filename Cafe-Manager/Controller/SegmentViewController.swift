//
//  SegmentViewController.swift
//  Cafe-Manager
//
//  Created by Ishanka Withanage on 2021-04-30.
//

import UIKit

class SegmentViewController: UIViewController {

      
    @IBOutlet weak var Preview: UIView!
    
    @IBOutlet weak var Menu: UIView!
    
    @IBOutlet weak var Category: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Segmentcontroller(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
                        case 0:
                            Preview.isHidden = false
                            Category.isHidden = true
                            Menu.isHidden = true
                        case 1:
                            Preview.isHidden = true
                            Category.isHidden = true
                            Menu.isHidden = false
                        case 2:
                            Preview.isHidden = true
                            Category.isHidden = false
                            Menu.isHidden = true
                        default:
                            Preview.isHidden = false
        }
        
        
    }
    
        
   
    
  

}
