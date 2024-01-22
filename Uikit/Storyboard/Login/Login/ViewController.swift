//
//  ViewController.swift
//  Login
//
//  Created by codes orbit on 22/08/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtUsernameSignin: UITextField!
    @IBOutlet weak var txtUserpasswordSignin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert() {
        var message = "Login Successful"
        if  self.txtUsernameSignin.text?.isEmpty == true  || self.txtUserpasswordSignin.text?.isEmpty == true  {
            message = "Login Fail Try again!"
        }
        // Create new Alert
        let dialogMessage = UIAlertController(title: "Login Information", message: message, preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            print(self.txtUsernameSignin.text ?? "---",self.txtUserpasswordSignin.text ?? "---")
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)

        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
}

