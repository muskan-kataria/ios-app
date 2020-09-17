//
//  ThirdVC.swift
//  Basic
//
//  Created by Muskan Muskan on 17/09/20.
//  Copyright © 2020 Muskan Muskan. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    //MARK:Properties
    
    @IBOutlet weak var UILabelField: UILabel!
    var Label3 :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        if((Label3) != nil)
        {
            UILabelField.text = Label3
        }
        else{
            UILabelField.text="Second"
        }
        
        }
        // Do any additional setup after loading the view.

    // MARK: - Navigation
       
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if(segue.identifier == "ThirdVCToFourthVC"){
                   let displayVC = segue.destination as! FourthVC
            displayVC.Label4 = "Third"
           }
       }
//MARK:Actions
   
    @IBAction func clickBackButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "second_vc") as? SecondVC else{return}
           self.present(vc, animated: true)
    }
    
    
    @IBAction func clickNextButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "fourth_vc") as? FourthVC else{return}
          self.performSegue(withIdentifier: "ThirdVCToFourthVC", sender: self)
           self.present(vc, animated: true)
    }
}
