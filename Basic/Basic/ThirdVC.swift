//
//  ThirdVC.swift
//  Basic
//
//  Created by Muskan Muskan on 17/09/20.
//  Copyright © 2020 Muskan Muskan. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController, DataDelegate {
    func sendData(data: String) {
        self.receivedDataLabel.text = data
    }
    

    //MARK:Properties
    
    @IBOutlet weak var UILabelField: UILabel!
    var Label3 :String?
    
    private var observer: NSObjectProtocol?
    
    @IBOutlet weak var receivedDataLabel: UILabel!
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData), name: Notification.Name("my notification"), object: nil)
       
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
                   
                   let alert = UIAlertController(title: "ThirdVC", message:"ThirdVc-1\\2\\3\\4", preferredStyle: .alert)
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
    
    @objc func dismissOnTapOutside(){
       self.dismiss(animated: true, completion: nil)
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
        // Do any additional setup after loading the view.

    // MARK: - Navigation
       
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if(segue.identifier == "ThirdVCToFourthVC"){
                   let displayVC = segue.destination as! FourthVC
            displayVC.Label4 = "Third"
            displayVC.delegate = self
            
           }
       }
//MARK:Actions
   
    @IBAction func clickBackButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "second_vc") as? SecondVC else{return}
        vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated: true)
    }
    
    
    @IBAction func clickNextButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "fourth_vc") as? FourthVC else{return}
          self.performSegue(withIdentifier: "ThirdVCToFourthVC", sender: self)
           self.present(vc, animated: true)
    }
}
