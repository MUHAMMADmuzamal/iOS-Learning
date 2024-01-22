//
//  RootViewController.swift
//  xibProject2
//
//  Created by codes orbit on 24/08/2023.
//

import UIKit

class RootViewController: UIViewController, ThirdViewControllerDelegate {
    
    @IBOutlet weak var username:UITextField!
    @IBOutlet weak var email:UITextField!
    private var data:[FormModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToList(_ sender:Any){
        let formValue:FormModel = FormModel(username: username.text!, email: email.text!)
        
        if find(findData: formValue) == true{
            let alert = UIAlertController(title: "Alert", message: "User already exists", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }else{
            data.append(formValue)
            let secondViewController = SecondViewController()
            secondViewController.items = data
            secondViewController.delegate = self
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    @IBAction func showCollectionView(_ sender: Any){
        
        
        let thirdViewController = ThirdViewController()
        thirdViewController.items = data
        thirdViewController.delegate = self
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
    func find(findData:FormModel) -> Bool {
        
        guard self.data.contains(where:{ (element) in
           return  (element.username == findData.username ||
                    element.email == findData.email) ? true: false
        })else{
            return false
        }
        return true
    }
}


extension RootViewController: SecondViewControllerDelegate{
    func getData(data: FormModel) {
        username.text = data.username
        email.text  = data.email
    }
}
