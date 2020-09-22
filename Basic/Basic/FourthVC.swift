//
//  FourthVC.swift
//  Basic
//
//  Created by Muskan Muskan on 17/09/20.
//  Copyright © 2020 Muskan Muskan. All rights reserved.
//

import UIKit

protocol DataDelegate
{
    func sendData(data: String)
}

class FourthVC: UIViewController {

       //MARK:Properties
        
    var delegate: DataDelegate? = nil
        @IBOutlet weak var UILabelField: UILabel!
    var Label4 : String?
    
    private var observer: NSObjectProtocol?
    
    
    @IBOutlet weak var dataToSendTextField: UITextField!
    
    
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

            observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
                       
                       let alert = UIAlertController(title: "FourthVC", message:"FourthVc-1\\2\\3\\4", preferredStyle: .alert)
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
    
        
    //MARK:Actions
       
    @IBAction func clickSendButton(_ sender: Any) {
        
//        let msg = [1:"BroadCasting"]
//        NotificationCenter.default.post(name: Notification.Name("my notification"), object: nil, userInfo: msg)
        
        if (self.delegate != nil) && self.dataToSendTextField != nil{
            let dataToSend = self.dataToSendTextField.text
            self.delegate?.sendData(data: dataToSend!)
            dismiss(animated: true, completion: nil)
        }
        
        
    }
    @IBAction func clickBackButton(_ sender: UIButton) {
            guard let vc = storyboard?.instantiateViewController(identifier: "third_vc") as? ThirdVC else{return}
            vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true)
        }
        
        
        @IBAction func clickNextButton(_ sender: UIButton) {
            let alert = UIAlertController(title: "My Alert", message: "No Next State ", preferredStyle: .alert)
            // Create the actions
                       let continueAction = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default) {
                              UIAlertAction in
                              NSLog("Continue Pressed")
                          }
                       
                       alert.addAction(continueAction)
            self.present(alert, animated: true, completion: nil)
            
        }
  

    

}
