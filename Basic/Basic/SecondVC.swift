//
//  SecondVC.swift
//  Basic
//
//  Created by Muskan Muskan on 17/09/20.
//  Copyright © 2020 Muskan Muskan. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    //MARK:Properties

    @IBOutlet weak var UILabelField: UILabel!
     var  Label2: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        if((Label2) != nil)
        {
            UILabelField.text=Label2}
        else
        { UILabelField.text="First"}
    
    
    
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if(segue.identifier == "SecondVCToThirdVC"){
                   let displayVC = segue.destination as! ThirdVC
            displayVC.Label3 = "Second"
           }
       }
    
    
//MARK:Actions
    
    @IBAction func clickBackButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "first_vc") as? FirstVC else{return}
        
       
        
           self.present(vc, animated: true)
        
    }
    @IBAction func clickNextButton(_ sender: UIButton) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "third_vc") as? ThirdVC else{return}
          
         self.performSegue(withIdentifier: "SecondVCToThirdVC", sender: self)
        self.present(vc, animated: true)
    }
    
}
