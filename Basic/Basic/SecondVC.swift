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
    
    private var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        if((Label2) != nil)
        {
            UILabelField.text=Label2}
        else
        { UILabelField.text="First"}
    

    NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData), name: Notification.Name("my notification"), object: nil)
    
     
        
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
                   
                   let alert = UIAlertController(title: "secondVC", message:"SecondVc-1\\2\\3\\4", preferredStyle: .alert)
            // Create the actions
                       let continueAction = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default) {
                              UIAlertAction in
                              NSLog("Continue Pressed")
                          }
                       
                       alert.addAction(continueAction)
                                                   self.present(alert, animated: true, completion:nil)
                                                   
                          // do whatever you want when the app is brought back to the foreground
                      }
        // Do any additional setup after loading the view.
    }
    
    deinit {
             if let observer = observer {
                 NotificationCenter.default.removeObserver(observer)
             }
         }
  
    
      @objc func onDidReceiveData(_ notification: Notification)
      {
          if let data = notification.userInfo as? [Int: String]
          {
              for(_, name) in data
              {
                  print("\(name)")
                 
              }
          }
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
        
    
        vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated: true)
        
    }
    @IBAction func clickNextButton(_ sender: UIButton) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "third_vc") as? ThirdVC else{return}
          
         self.performSegue(withIdentifier: "SecondVCToThirdVC", sender: self)
        self.present(vc, animated: true)
    }
    
}
