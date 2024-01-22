//
//  ViewController.swift
//  xibProject
//
//  Created by codes orbit on 24/08/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x: 100, y: 100, width: 120, height: 240)
             let newView = FirstComponent(frame: rect)
           //  newView.mainView.backgroundColor = .green
             self.view.addSubview(newView)
        // Do any additional setup after loading the view.
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
