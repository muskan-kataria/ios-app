//
//  FourthVC.swift
//  Basic
//
//  Created by Muskan Muskan on 17/09/20.
//  Copyright © 2020 Muskan Muskan. All rights reserved.
//

import UIKit

class FourthVC: UIViewController {

       //MARK:Properties
        
        @IBOutlet weak var UILabelField: UILabel!
    var Label4 : String?
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .orange
            

            if((Label4) != nil)
            {
                UILabelField.text = Label4
            }
            else{
                UILabelField.text="Third"
            }
            
            // Do any additional setup after loading the view.
        }
        
    //MARK:Actions
       
        @IBAction func clickBackButton(_ sender: UIButton) {
            guard let vc = storyboard?.instantiateViewController(identifier: "third_vc") as? ThirdVC else{return}
               self.present(vc, animated: true)
        }
        
        
        @IBAction func clickNextButton(_ sender: UIButton) {
            let alert = UIAlertController(title: "My Alert", message: "No Next State ", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }

    

}
