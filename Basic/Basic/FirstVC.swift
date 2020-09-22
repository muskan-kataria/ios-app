//
//  FirstVC.swift
//  Basic
//
//  Created by Muskan Muskan on 17/09/20.
//  Copyright © 2020 Muskan Muskan. All rights reserved.
//

import UIKit
import UserNotifications

class FirstVC: UIViewController,UIApplicationDelegate, UNUserNotificationCenterDelegate{
    
   
    //MARK:Properties
    
    @IBOutlet weak var UILAbelField: UILabel!
    let center = UNUserNotificationCenter.current()
    
   
    private var observer: NSObjectProtocol?

    

     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UILAbelField.text="This is 1\\2\\3\\4 based Controller"
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData), name: Notification.Name("my notification"), object: nil)
        // Do any additional setup after loading the view.
        
      
        

        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
        
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
            
            let alert = UIAlertController(title: "FirstVC", message:"FirstVc-1\\2\\3\\4", preferredStyle: .alert)
            // Create the actions
                       let continueAction = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default) {
                              UIAlertAction in
                              NSLog("Continue Pressed")
                          }
                       
                       alert.addAction(continueAction)
                                            self.present(alert, animated: true, completion:nil)
                                           
                   // do whatever you want when the app is brought back to the foreground
               }
       
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
        if(segue.identifier == "FirstVCToSecondVC"){
                let displayVC = segue.destination as! SecondVC
        displayVC.Label2 = "First"
        }
    }
    
    //MARK:Actions
    
    @IBAction func clickBackButton(_ sender: UIButton) {
    let alert = UIAlertController(title: "My Alert", message: "No Previous State ", preferredStyle: .alert)
        // Create the actions
        let continueAction = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default) {
               UIAlertAction in
               NSLog("Continue Pressed")
           }
        
        alert.addAction(continueAction)
        self.present(alert, animated: true, completion:nil)
        
    }
    
   
    
    
    @IBAction func clickNextButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "second_vc") as? SecondVC else{return}
    
      self.performSegue(withIdentifier: "FirstVCToSecondVC", sender: self)
    
    self.present(vc, animated: true)
    }
    
  
    
}





