//
//  TableViewController.swift
//  FoodDelivery
//
//  Created by codes orbit on 20/09/2023.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var table:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "FoodBannerTableViewCell", bundle: nil), forCellReuseIdentifier: FoodBannerTableViewCell.identifier)
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
