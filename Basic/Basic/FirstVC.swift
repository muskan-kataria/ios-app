//
//  FirstVC.swift
//  Basic
//
//  Created by Muskan Muskan on 17/09/20.
//  Copyright © 2020 Muskan Muskan. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
   
    //MARK:Properties
    
    @IBOutlet weak var UILAbelField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UILAbelField.text="This is 1\\2\\3\\4 based Controller"
        // Do any additional setup after loading the view.
    }
    
   // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "FirstVCToSecondVC"){
                let displayVC = segue.destination as! SecondVC
        displayVC.Label2 = "First"
        }
    }
    
    //MARK:Actions
    
    @IBAction func clickBackButton(_ sender: UIButton) {
    let alert = UIAlertController(title: "My Alert", message: "No Previous State ", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clickNextButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "second_vc") as? SecondVC else{return}
    
      self.performSegue(withIdentifier: "FirstVCToSecondVC", sender: self)
        
    self.present(vc, animated: true)
    }
    
}
