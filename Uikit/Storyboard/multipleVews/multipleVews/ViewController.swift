//
//  ViewController.swift
//  multipleVews
//
//  Created by codes orbit on 23/08/2023.
//

import UIKit

class ViewController: UIViewController {

    private var loginUsersSet = Set<LoginModel>()
    var currentData:LoginModel?
    
    @IBOutlet weak var username:UITextField!
    @IBOutlet weak var email:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        username.text = currentData?.username
        email.text = currentData?.email
    }
    @IBAction func addToList() {
        if (username.text?.isEmpty == true || email.text?.isEmpty == true)  {
            let dialogMessage = UIAlertController(title: "Error", message: "fill all fields", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)

        }else{
            currentData = LoginModel(id:username.text!+email.text!,username: username.text ?? "", email: email.text ?? "")
            loginUsersSet.insert(currentData!)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableview" {
            if let destination = segue.destination as? SecondViewController {
                destination.loginUsersSet = loginUsersSet
                destination.delegate = self
            }
        }
    }
}



extension ViewController: ViewControllerDelegate
{

    func updateData(data: LoginModel){
        print("data get back",data)
            self.currentData = data
            print("cruuent data after update", currentData)
    
        
    }
}
