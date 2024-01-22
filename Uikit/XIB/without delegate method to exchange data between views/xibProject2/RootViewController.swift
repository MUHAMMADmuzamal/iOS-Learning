//
//  RootViewController.swift
//  xibProject2
//
//  Created by codes orbit on 24/08/2023.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var username:UITextField!
    @IBOutlet weak var email:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        if !FormModel.data.isEmpty{
            let index = FormModel.data.index(FormModel.data.startIndex, offsetBy: FormModel.selectedValueIndex!)
            username.text = FormModel.data[index].username
            email.text = FormModel.data[index].email
        }
    }
    @IBAction func addToList(_ sender:Any){
        let formValue:FormModel = FormModel(username: username.text, email: email.text)
        
        if !FormModel.find(findData: formValue){
            FormModel.addData(data: formValue)
            FormModel.selectedValueIndex = FormModel.data.count - 1
            self.navigationController?.pushViewController(SecondViewController(), animated: true)
        }else{
            let alert = UIAlertController(title: "Alert", message: "User already exists", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func showCollectionView(_ sender: Any){
        self.navigationController?.pushViewController(ThirdViewController(), animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
